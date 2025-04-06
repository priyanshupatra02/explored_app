//the access point for the controller of the ui to interact with the state

import 'package:edtech_app/data/network/api_helper.dart';
import 'package:edtech_app/shared/api_client/dio/dio_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiHelperProvider = Provider.autoDispose<ApiHelper>(
  (ref) {
    return ApiHelper(
      dio: ref.watch(dioProvider),
    );
  },
  name: "apiHelperProvider",
);
