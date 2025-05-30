import 'package:dio/dio.dart';
import 'package:edtech_app/data/model/blog_categories_model.dart';
import 'package:edtech_app/data/model/blog_model.dart';
import 'package:edtech_app/data/model/login_user_response_model.dart';
import 'package:edtech_app/data/model/quiz_model.dart';
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
  Future<Result<QuizModel, APIException>> getQuizByVideoId({required String videoId}) async {
    final result = await dio.get(AppUrls.getQuizByVideoId + videoId);
    return result.successErrorHandler<QuizModel>(
      successMapper: (data) => QuizModel.fromMap(data),
      defaultSuccessCode: [200, 201],
    );
  }

  //get quiz progress by video id
  // Future<Result<VideosModel, APIException>> getQuizProgressByVideoId({required String videoId}) async {
  //   final result = await dio.get('${AppUrls.getQuizProgressByVideoId}$videoId');
  //   return result.successErrorHandler<VideosModel>(
  //     successMapper: (data) => VideosModel.fromMap(data),
  //     defaultSuccessCode: [200, 201],
  //   );
  // }
  //get videos by subject id
  Future<Result<VideosModel, APIException>> getVideosBySubject({required String subjectId}) async {
    final result = await dio.get('${AppUrls.getVideosBySubjectId}$subjectId');
    return result.successErrorHandler<VideosModel>(
      successMapper: (data) => VideosModel.fromMap(data),
      defaultSuccessCode: [200, 201],
    );
  }

  //get videos by id
  //submit quiz results
  // Future<Result<bool, AppException>> submitQuizResults({
  //   required Map<String, bool> results,
  // }) async {
  //   try {
  //     final response = await dio.post(
  //       QuizApiConstants.submitQuiz,
  //       data: {
  //         'data': results,
  //       },
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return Result.success(true);
  //     } else {
  //       return Result.error(
  //         AppException(
  //           errorMessage: 'Failed to submit quiz. Status: ${response.statusCode}',
  //         ),
  //       );
  //     }
  //   } on DioException catch (e) {
  //     return Result.error(
  //       AppException(
  //         errorMessage: 'Network error: ${e.message}',
  //         statusCode: e.response?.statusCode,
  //       ),
  //     );
  //   } catch (e) {
  //     return Result.error(
  //       AppException(
  //         errorMessage: 'An error occurred while submitting quiz: ${e.toString()}',
  //       ),
  //     );
  //   }
  // }
}
