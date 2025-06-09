import 'dart:async';

import 'package:edtech_app/data/model/user_response_model.dart';
import 'package:edtech_app/data/network/api_helper_pod.dart';
import 'package:edtech_app/data/services/login_db_service/login_db_service_pod.dart';
import 'package:edtech_app/features/login/controller/state/register_user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterUserAsyncNotifier extends AutoDisposeAsyncNotifier<RegisterUserState> {
  @override
  FutureOr<RegisterUserState> build() {
    return InitialRegisterUserState();
  }

  Future<void> registerUser({
    required String email,
    required String password,
    required String firstName,
    required void Function({required UserResponseModel userResponse}) onUserRegistered,
  }) async {
    state = AsyncData(RegisteringUserState());
    state = await AsyncValue.guard(() async {
      final registeredUserResult = await ref.watch(apiHelperProvider).registerUser(
            firstName: firstName,
            email: email,
            password: password,
          );

      return registeredUserResult.when(
        (registeredUserResponse) async {
          if (registeredUserResponse.jwt != null) {
            await ref.read(loginDbProvider).saveLoginModel(
                  userResponseModel: registeredUserResponse,
                );
            onUserRegistered(userResponse: registeredUserResponse);
            return const RegisteredUserState();
          } else {
            return const NotRegisteredUserState();
          }
        },
        (error) => RegisterUserErrorState(
          error.errorMessage,
        ),
      );
    });
  }
}
