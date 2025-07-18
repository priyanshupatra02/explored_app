import 'package:edtech_app/const/env/env.dart';

/// This class helping putting all
/// the urls needed in apps
class AppUrls {
  AppUrls._();
  //get the base urls from the env file
  static const String devBaseUrl = Env.developmentBaseUrl;

  //setting up base urls
  static const String baseURL = devBaseUrl;

  static const String getUser = "/v1/users/me";
  static const String signInUser = "/v1/auth/sign-in";
  static const String registerUser = "/v1/auth/register";
  static const String updateuser = "/v1/users/";
  static const String getSubjects = "/v1/subjects";
  static const String getBlogCategories = "/v1/categories";
  static const String getBlogs = "/v1/blogs";
  static const String getBlogComments = "/v1/blog-comments";
  static const String addBlogComment = "/v1/blog-comments";
  static const String quizProgress = "/v1/quiz-progresses";
  static const String getAllVideosBySubjectId = "/v1/videos?filters[subject][documentId]=";
  static const String getSingleVideoByVideoId = "/v1/videos/";

  static const String getQuizByVideoId = "/v1/quizzes?filters[video][documentId]=";
  static const String getQuizProgressByVideoId = "/v1/quiz-progresses?filters[video][documentId]=";
}
