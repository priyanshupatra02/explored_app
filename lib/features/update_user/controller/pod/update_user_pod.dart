
import 'package:edtech_app/features/update_user/controller/notifier/update_user_async_notifier.dart';
import 'package:edtech_app/features/update_user/controller/state/update_user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final updateUserProvider =
    AsyncNotifierProvider.autoDispose<UpdateUserAsyncNotifier, UpdateUserState>(
  UpdateUserAsyncNotifier.new,
  name: "updateUserProvider",
);
