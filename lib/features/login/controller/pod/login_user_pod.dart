import 'package:edtech_app/features/login/controller/notifier/login_user_notifier.dart';
import 'package:edtech_app/features/login/controller/state/login_user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginUserProvider =
    AsyncNotifierProvider.autoDispose<LoginUserAsyncNotifier, LoginUserState>(
  LoginUserAsyncNotifier.new,
  name: 'loginUserProvider',
);
