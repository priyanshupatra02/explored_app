import 'package:edtech_app/core/local_storage/app_storage_pod.dart';
import 'package:edtech_app/data/services/login_db_service/login_db_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginDbProvider = Provider.autoDispose<LoginDbService>(
  (ref) {
    return LoginDbService(appStorage: ref.watch(appStorageProvider));
  },
  name: 'loginDbProvider',
);
