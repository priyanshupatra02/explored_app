import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/bootstrap.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/data/services/login_db_service/login_db_service.dart';

class LoginGuard extends AutoRouteGuard {
  // final AuthState authState;
  final LoginDbService loginDbService;

  LoginGuard({
    required this.loginDbService,
  });
  @override

  /// A class that provides database services for token management.
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final token = loginDbService.getLoginModel()?.jwt;
    final feedback = loginDbService.getLoginModel()?.user?.feedback;
    if (token != null && feedback == null) {
      talker.debug('hi 1');
      router.replaceAll([UpdateUserRoute()]);

      resolver.next(false);
    } else if (token != null && feedback != null) {
      talker.debug('hi 2');
      router.replaceAll([NavbarRoute()]);
      resolver.next(false);
    } else {
      talker.debug('hi 3');
      resolver.next(true);
    }
  }
}
