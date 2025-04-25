import 'package:dio/dio.dart';
import 'package:edtech_app/bootstrap.dart';
import 'package:edtech_app/data/services/login_db_service/i_login_db_service.dart';
import 'package:edtech_app/shared/api_client/dio/default_api_error_handler.dart';

// coverage:ignore-file

///This one is default interceptor which includes default api
///error handler
class DefaultAPIInterceptor extends Interceptor {
  final ILoginDbService loginDbService;
  DefaultAPIInterceptor({
    required this.dio,
    required this.loginDbService,
  });
  final Dio dio;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    _handleDefaultRequest(options, handler);
  }

  void _handleDefaultRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final loginUserModel = loginDbService.getLoginModel();
    bool includeAuthToken = true;

    Map<String, dynamic> requestHeaders = {};

    if (options.path.endsWith('/false')) {
      includeAuthToken = false;
      String formattedURL = options.path.replaceAll('/false', '');
      options.path = formattedURL;
    }

    if (includeAuthToken && loginUserModel != null) {
      talker.debug("token in request - ${loginUserModel.jwt}");
      requestHeaders.putIfAbsent('Authorization', () => 'Bearer ${loginUserModel.jwt}');
    }

    options.headers.addAll(requestHeaders);
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    defaultAPIErrorHandler(err, handler, dio);
  }
}
