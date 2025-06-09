import 'package:edtech_app/data/model/profile_model.dart';
import 'package:edtech_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getProfileProvider = FutureProvider.autoDispose<ProfileModel>(
  (ref) async {
    final result = await ref.watch(apiHelperProvider).getUser();

    return result.when(
      (profileModel) {
        return profileModel;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "getProfileProvider",
);
