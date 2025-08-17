import 'dart:async';

import 'package:edtech_app/data/model/delete_account_model.dart';
import 'package:edtech_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteAccountAsyncNotifier extends AutoDisposeAsyncNotifier<DeleteAccountModel?> {
  @override
  FutureOr<DeleteAccountModel?> build() {
    return null;
  }

  Future<bool> deleteUserAccount() async {
    try {
      bool success = false; //to show snackbar
      final result = await ref.read(apiHelperProvider).deleteUser();

      result.when(
        (response) {
          state = AsyncData(response);
          success = true;
        },
        (error) {
          state = AsyncValue.error(error.errorMessage, StackTrace.current);
          success = false;
        },
      );

      return success;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      return false;
    }
  }
}
