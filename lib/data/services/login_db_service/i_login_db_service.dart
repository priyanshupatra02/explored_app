import 'package:edtech_app/data/model/login_user_response_model.dart';

abstract class ILoginDbService {
  Future<void> saveLoginModel({required LoginUserResponseModel loginModel});
  Future<void> deleteLoginModel();
  LoginUserResponseModel? getLoginModel();
}
