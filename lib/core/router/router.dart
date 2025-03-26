import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: CounterRoute.page,
      path: '/counter',
    ),
    AutoRoute(
      page: NavbarRoute.page,
      path: '/navbar',
      initial: true,
    ),
    AutoRoute(
      page: OnboardingRoute.page,
      path: '/onboarding',
    ),
    AutoRoute(
      page: HomeRoute.page,
      path: '/home',
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
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
  ];
}
