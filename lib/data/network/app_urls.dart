import 'package:edtech_app/const/env/env.dart';

/// This class helping putting all
/// the urls needed in apps
class AppUrls {
  AppUrls._();
  //get the base urls from the env file
  static const String devBaseUrl = Env.developmentBaseUrl;

  //setting up base urls
  static const String baseURL = devBaseUrl;

  static const String signInUser = "/v1/auth/local";
}
