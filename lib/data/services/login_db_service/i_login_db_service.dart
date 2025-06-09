import 'package:edtech_app/data/model/user_response_model.dart';

abstract class ILoginDbService {
  Future<void> saveLoginModel({required UserResponseModel userResponseModel});
  Future<void> deleteLoginModel();
  UserResponseModel? getLoginModel();
}
