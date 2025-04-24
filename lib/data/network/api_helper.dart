import 'package:dio/dio.dart';
import 'package:edtech_app/data/model/login_user_response_model.dart';
import 'package:edtech_app/data/network/app_urls.dart';
import 'package:edtech_app/shared/exception/base_exception.dart';
import 'package:edtech_app/shared/extension/response_success_error_handler.dart';
import 'package:multiple_result/multiple_result.dart';

class ApiHelper {
  final Dio dio;

  ApiHelper({required this.dio});

  //login user
  Future<Result<LoginUserResponseModel, APIException>> loginUser({
    required String email,
    required String password,
  }) async {
    final result = await dio.post(
      AppUrls.signInUser,
      data: {
        "identifier": email,
        "password": password,
      },
    );
    return result.successErrorHandler<LoginUserResponseModel>(
      successMapper: (data) => LoginUserResponseModel.fromMap(data),
      defaultSuccessCode: [200, 201],
    );
  }
}
