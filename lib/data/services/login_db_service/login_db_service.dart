import 'package:edtech_app/core/local_storage/app_storage.dart';
import 'package:edtech_app/data/model/login_user_response_model.dart';

import 'i_login_db_service.dart';

class LoginDbService implements ILoginDbService {
  final AppStorage appStorage;
  LoginDbService({
    required this.appStorage,
  });

  final loginModelKey = 'loginModel';
  @override
  Future<void> deleteLoginModel() async {
    final box = appStorage.appBox;
    await box?.delete(loginModelKey);
  }

  @override
  LoginUserResponseModel? getLoginModel() {
    final box = appStorage.appBox;
    final loginModel = box?.get(loginModelKey) as String?;
    if (loginModel != null) {
      return LoginUserResponseModel.fromJson(loginModel);
    } else {
      return null;
    }
  }

  @override
  Future<void> saveLoginModel({required LoginUserResponseModel loginModel}) async {
    final box = appStorage.appBox;
    await box?.put(loginModelKey, loginModel.toJson());
  }
}
