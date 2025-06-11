import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/core/guards/login_guard.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/data/services/login_db_service/login_db_service.dart';
import 'package:flutter/cupertino.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final LoginDbService loginDbService;
  AppRouter({
    required this.loginDbService,
  });
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: CounterRoute.page,
      path: '/counter',
    ),
    AutoRoute(
      page: NavbarRoute.page,
      path: '/navbar',
    ),
    AutoRoute(
      page: OnboardingRoute.page,
      path: '/onboarding',
      // initial: true,
      // guards: [
      //   LoginGuard(loginDbService: loginDbService),
      // ],
    ),
    AutoRoute(
      page: HomeRoute.page,
      path: '/home',
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/',
      initial: true,
      guards: [
        LoginGuard(loginDbService: loginDbService),
      ],
    ),
    AutoRoute(
      page: VerifyCodeRoute.page,
      path: '/verify-code',
    ),
    AutoRoute(
      page: UpdateUserRoute.page,
      path: '/update-user',
    ),
    AutoRoute(
      page: BlogsRoute.page,
      path: '/blogs',
    ),
    AutoRoute(
      page: BlogDetailsRoute.page,
      path: '/blog-details',
    ),
    AutoRoute(
      page: ProfileRoute.page,
      path: '/profile',
    ),
    AutoRoute(
      page: ForumsRoute.page,
      path: '/forums',
    ),
    AutoRoute(
      page: VideosRoute.page,
      path: '/videos',
    ),
    AutoRoute(
      page: VideoPlayerRoute.page,
      path: '/video-player',
    ),
    AutoRoute(
      page: TermsAndConditionsRoute.page,
      path: '/terms-and-conditions',
    ),
    AutoRoute(
      page: PrivacyAndPolicyRoute.page,
      path: '/privacy-and-policy',
    ),
    AutoRoute(
      page: QuizRoute.page,
      path: '/quiz',
    ),
    AutoRoute(
      page: QuizProgressRoute.page,
      path: '/quiz-progress',
    ),
    AutoRoute(
      page: SubscriptionPlansRoute.page,
      path: '/subscription-plans',
    ),
    //blog comment section sheet route
    CustomRoute(
      page: BlogCommentDialogRoute.page,
      path: '/blog-comment-section',
      customRouteBuilder: <T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
        return CupertinoSheetRoute(
          settings: page,
          builder: (_) => child,
        );
      },
    ),
  ];
}
