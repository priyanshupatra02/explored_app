import 'package:edtech_app/features/login/controller/notifier/login_user_notifier.dart';
import 'package:edtech_app/features/login/controller/state/login_user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginUserProvider =
    AsyncNotifierProvider.autoDispose.family<LoginUserAsyncNotifier, LoginUserState, LoginUserParams>(
  LoginUserAsyncNotifier.new,
  name: 'verifyOtpProvider',
);


class LoginUserParams{
  final String email;
  final String password;

  LoginUserParams({
    required this.email,
    required this.password,
  });
}