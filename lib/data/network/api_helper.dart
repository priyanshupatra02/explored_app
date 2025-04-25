import 'package:dio/dio.dart';
import 'package:edtech_app/data/model/blog_categories_model.dart';
import 'package:edtech_app/data/model/blog_model.dart';
import 'package:edtech_app/data/model/login_user_response_model.dart';
import 'package:edtech_app/data/model/subject_list_model.dart';
import 'package:edtech_app/data/model/videos_list_model.dart';
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

  //update user
  //get subjects
  Future<Result<SubjectListModel, APIException>> getSubjects() async {
    final result = await dio.get(AppUrls.getSubjects);
    return result.successErrorHandler<SubjectListModel>(
      successMapper: (data) => SubjectListModel.fromMap(data),
      defaultSuccessCode: [200, 201],
    );
  }

  //get categories
  Future<Result<BlogsCategoriesModel, APIException>> getBlogCategories() async {
    final result = await dio.get(AppUrls.getBlogCategories);
    return result.successErrorHandler<BlogsCategoriesModel>(
      successMapper: (data) => BlogsCategoriesModel.fromMap(data),
      defaultSuccessCode: [200, 201],
    );
  }

  //get all blogs
  Future<Result<BlogModel, APIException>> getBlogs() async {
    final result = await dio.get(AppUrls.getBlogs);
    return result.successErrorHandler<BlogModel>(
      successMapper: (data) => BlogModel.fromMap(data),
      defaultSuccessCode: [200, 201],
    );
  }
  //get blogs by id
  //get blogs comments
  //get quiz
  //get quiz progress
  //get videos by subject id
  Future<Result<VideosModel, APIException>> getVideosBySubject({required String subjectId}) async {
    final result = await dio.get('${AppUrls.getVideosBySubjectId}$subjectId');
    return result.successErrorHandler<VideosModel>(
      successMapper: (data) => VideosModel.fromMap(data),
      defaultSuccessCode: [200, 201],
    );
  }
  //get videos by id
}
