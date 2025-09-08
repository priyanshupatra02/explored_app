import 'dart:async';

import 'package:edtech_app/data/model/user_response_model.dart';
import 'package:edtech_app/data/network/api_helper_pod.dart';
import 'package:edtech_app/data/services/login_db_service/login_db_service_pod.dart';
import 'package:edtech_app/features/login/controller/state/login_user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginUserAsyncNotifier extends AutoDisposeAsyncNotifier<LoginUserState> {
  @override
  FutureOr<LoginUserState> build() {
    return const InitialLoginUserState();
  }

  Future<void> loginUser({
    required String email,
    required String password,
    required void Function(UserResponseModel loginModelResponse) onUserLoggedIn,
  }) async {
    state = const AsyncData(LoggingInUserState());
    state = await AsyncValue.guard(
      () async {
        final result = await ref.read(apiHelperProvider).loginUser(
              email: email,
              password: password,
            );

        return result.when(
          (loginModel) async {
            if (loginModel.jwt!.isNotEmpty) {
              await ref.read(loginDbProvider).saveLoginModel(userResponseModel: loginModel);
              onUserLoggedIn(loginModel);
              return const LoggedInState();
            } else {
              return const NotLoggedInUserState();
            }
          },
          (error) => LoginUserErrorState(
            error.errorMessage,
          ),
        );
      },
    );
  }
}
