import 'package:edtech_app/features/login/controller/notifier/register_user_notifier.dart';
import 'package:edtech_app/features/login/controller/state/register_user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerUserProvider =
    AsyncNotifierProvider.autoDispose<RegisterUserAsyncNotifier, RegisterUserState>(
  RegisterUserAsyncNotifier.new,
  name: "registerUserProvider",
);
