import 'package:edtech_app/data/model/delete_account_model.dart';
import 'package:edtech_app/features/profile/controller/notifier/delete_account_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteAccountProvider =
    AsyncNotifierProvider.autoDispose<DeleteAccountAsyncNotifier, DeleteAccountModel?>(
  DeleteAccountAsyncNotifier.new,
  name: "deleteAccountProvider",
);
