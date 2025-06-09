import 'package:dio/dio.dart';
import 'package:edtech_app/data/model/blog_categories_model.dart';
import 'package:edtech_app/data/model/blog_model.dart';
import 'package:edtech_app/data/model/profile_model.dart';
import 'package:edtech_app/data/model/quiz_model.dart';
import 'package:edtech_app/data/model/single_video_model.dart';
import 'package:edtech_app/data/model/subject_list_model.dart';
import 'package:edtech_app/data/model/user_response_model.dart';
import 'package:edtech_app/data/model/videos_list_model.dart';
import 'package:edtech_app/data/network/app_urls.dart';
import 'package:edtech_app/shared/algorithms/algorithms.dart';
import 'package:edtech_app/shared/exception/base_exception.dart';
import 'package:edtech_app/shared/extension/response_success_error_handler.dart';
import 'package:multiple_result/multiple_result.dart';

class ApiHelper {
  final Dio dio;

  ApiHelper({required this.dio});

  //get user
  Future<Result<ProfileModel, APIException>> getUser() async {
    final result = await dio.get(AppUrls.getUser);
    return result.successErrorHandler<ProfileModel>(
      successMapper: (data) => ProfileModel.fromMap(data),
      defaultSuccessCode: [200, 201],
    );
  }

  //login user
  Future<Result<UserResponseModel, APIException>> loginUser({
    required String email,
    required String password,
  }) async {
    final result = await dio.post(
      AppUrls.signInUser,
      data: {
        "email": email,
        "password": password,
      },
    );
    return result.successErrorHandler<UserResponseModel>(
      successMapper: (data) => UserResponseModel.fromMap(data),
      defaultSuccessCode: [200, 201],
    );
  }

  //update user
  Future<Result<UserResponseModel, APIException>> updateUser({
    required String firstName,
    required String lastname,
    required String email,
    required String userId,
    required String whatCourseDoYouNeed,
    required String doYouNeedCareerCounselling,
    required String whatDoYouDo,
    required String wouldYouLikeToBeACareerCounsellor,
    required String whichActivityDoYouEnjoyTheMost,
    required String whatKindOfChallengesExciteYou,
    required String doYouPreferWorkingWith,
    required String whatDoYouEnjoyDoingInYourFreeTime,
    required String whatComesNaturallyToYou,
    required String whichSubjectWouldYouEnjoyTheMost,
    required String whatKindOfWorkEnvironmentSuitsYou,
    required String howDoYouApproachProblems,
    required String whichSkillAreYouBestAt,
    required String whatMotivatesYouMostInACareer,
    required String doYouPreferWorking,
    required String doYouLikeJobsThatInvolve,
    required String howDoYouFeelAboutDeadlines,
    required String wouldYouRather,
    required String whatKindOfJobStructureDoYouPrefer,
    required String wouldYouEnjoyACareerWhereYou,
    required String wouldYouLikeToTravelForWork,
    required String whatWouldMakeYouHappiestInAJob,
    required String doYouEnjoyWorkingWithTechnology,
    required String areYouInterestedInHealthcareOrMedicine,
    required String wouldYouLikeToWorkInEducationOrTeaching,
    required String doYouEnjoyResearchAndAnalysis,
    required String areYouInterestedInPsychologyOrCounseling,
    required String wouldYouLikeACareerInMediaOrFilmOrEntertainment,
    required String whatIsMoreImportantToYouInAJob,
    required String wouldYouRatherDo,
    required String whatKindOfEmployerDoYouPrefer,
    required String whereWouldYouRatherWork,
    required String areYouMoreOfA,
    required String doYouPrefer,
  }) async {
    final result = await dio.put(
      '${AppUrls.updateuser}$userId',
      data: {
        "firstName": firstName,
        "lastName": lastname,
        "email": email,
        "whatCourseDoYouNeed": whatCourseDoYouNeed,
        "doYouNeedACareerCounselling": doYouNeedCareerCounselling,
        "wouldYouLikeToBeACareerCounsellor": wouldYouLikeToBeACareerCounsellor,
        "whatDoYouDo": whatDoYouDo,
        "feedback": {
          "whichActivityDoYouEnjoyTheMost": whichActivityDoYouEnjoyTheMost,
          "whatKindOfChallengesExciteYou": whatKindOfChallengesExciteYou,
          "doYouPreferWorkingWith": doYouPreferWorkingWith,
          "whatDoYouEnjoyDoingInYourFreeTime": whatDoYouEnjoyDoingInYourFreeTime,
          "whatComesNaturallyToYou": whatComesNaturallyToYou,
          "whichSubjectWouldYouEnjoyTheMost": whichSubjectWouldYouEnjoyTheMost,
          "whatKindOfWorkEnvironmentSuitsYou": whatKindOfWorkEnvironmentSuitsYou,
          "howDoYouApproachProblems": howDoYouApproachProblems,
          "whichSkillAreYouBestAt": whichSkillAreYouBestAt,
          "whatMotivatesYouMostInACareer": whatMotivatesYouMostInACareer,
          "doYouPreferWorking": doYouPreferWorking,
          "doYouLikeJobsThatInvolve": doYouLikeJobsThatInvolve,
          "wouldYouRather": wouldYouRather,
          "howDoYouFeelAboutDeadlines": howDoYouFeelAboutDeadlines,
          "whatKindOfJobStructureDoYouPrefer": whatKindOfJobStructureDoYouPrefer,
          "wouldYouEnjoyACareerWhereYou": wouldYouEnjoyACareerWhereYou,
          "wouldYouLikeToTravelForWork": wouldYouLikeToTravelForWork,
          "whatWouldMakeYouHappiestInAJob": whatWouldMakeYouHappiestInAJob,
          "doYouEnjoyWorkingWithTechnology": doYouEnjoyWorkingWithTechnology,
          "areYouInterestedInHealthcareOrMedicine": areYouInterestedInHealthcareOrMedicine,
          "wouldYouLikeToWorkInEducationOrTeaching": wouldYouLikeToWorkInEducationOrTeaching,
          "doYouEnjoyResearchAndAnalysis": doYouEnjoyResearchAndAnalysis,
          "areYouInterestedInPsychologyOrCounseling": areYouInterestedInPsychologyOrCounseling,
          "wouldYouLikeACareerInMediaFilmOrEntertainment":
              wouldYouLikeACareerInMediaOrFilmOrEntertainment,
          "whatIsMoreImportantToYouInAJob": whatIsMoreImportantToYouInAJob,
          "wouldYouRatherDo": wouldYouRatherDo,
          "whatKindOfEmployerDoYouPrefer": whatKindOfEmployerDoYouPrefer,
          "whereWouldYouRatherWork": whereWouldYouRatherWork,
          "areYouMoreOfA": areYouMoreOfA,
          "doYouPrefer": doYouPrefer
        }
      },
    );
    return result.successErrorHandler<UserResponseModel>(
      successMapper: (data) => UserResponseModel.fromMap(data),
      defaultSuccessCode: [200, 201],
    );
  }

  //register/signup user
  Future<Result<UserResponseModel, APIException>> registerUser({
    required String email,
    required String password,
    required String firstName,
  }) async {
    final username = Algorithms.padStringToThreeChars(input: firstName);
    final result = await dio.post(
      AppUrls.registerUser,
      data: {
        "username": username,
        "firstName": firstName,
        "email": email,
        "password": password,
      },
    );
    return result.successErrorHandler<UserResponseModel>(
      successMapper: (data) => UserResponseModel.fromMap(data),
      defaultSuccessCode: [200, 201],
    );
  }

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
    final result = await dio.get('${AppUrls.getAllVideosBySubjectId}$subjectId');
    return result.successErrorHandler<VideosModel>(
      successMapper: (data) => VideosModel.fromMap(data),
      defaultSuccessCode: [200, 201],
    );
  }

  //get videos by video id
  Future<Result<SingleVideoModel, APIException>> getSingleVideoByVideoId(
      {required String videoId}) async {
    final result = await dio.get('${AppUrls.getSingleVideoByVideoId}$videoId');
    return result.successErrorHandler<SingleVideoModel>(
      successMapper: (data) => SingleVideoModel.fromMap(data),
      defaultSuccessCode: [200, 201],
    );
  }
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
