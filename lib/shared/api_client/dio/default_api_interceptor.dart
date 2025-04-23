import 'package:dio/dio.dart';
import 'package:edtech_app/shared/api_client/dio/default_api_error_handler.dart';

// coverage:ignore-file

///This one is default interceptor which includes default api
///error handler
class DefaultAPIInterceptor extends Interceptor {
  DefaultAPIInterceptor({
    required this.dio,
  });
  final Dio dio;
  @override

  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
  //   _handleDefaultRequest(options, handler);
  // }

  // void _handleDefaultRequest(RequestOptions options, RequestInterceptorHandler handler) async {
  //   final verifiedUserModel = verifyOtpDbService.getVerifyOtpModel();
  //   bool includeAuthToken = true;

  //   Map<String, dynamic> requestHeaders = {};

  //   if (options.path.endsWith('/false')) {
  //     includeAuthToken = false;
  //     String formattedURL = options.path.replaceAll('/false', '');
  //     options.path = formattedURL;
  //   }

  //   if (includeAuthToken && verifiedUserModel != null) {
  //     talker.debug("token in request - ${verifiedUserModel.token}");
  //     requestHeaders.putIfAbsent('Authorization', () => 'Bearer ${verifiedUserModel.token}');
  //   }

  //   options.headers.addAll(requestHeaders);
  //   handler.next(options);
  // }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    defaultAPIErrorHandler(err, handler, dio);
  }
}
