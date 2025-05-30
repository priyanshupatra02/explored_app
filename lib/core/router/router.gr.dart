// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:edtech_app/features/blogs/view/blogs_page.dart' as _i2;
import 'package:edtech_app/features/blogs_details/view/blog_details_page.dart'
    as _i1;
import 'package:edtech_app/features/counter/view/counter_page.dart'
    deferred as _i3;
import 'package:edtech_app/features/forums/view/forums_page.dart' as _i4;
import 'package:edtech_app/features/home/view/home_page.dart' as _i5;
import 'package:edtech_app/features/login/view/login_page.dart' as _i6;
import 'package:edtech_app/features/navbar/view/navbar_page.dart'
    deferred as _i7;
import 'package:edtech_app/features/onboarding/view/onboarding_page.dart'
    as _i8;
import 'package:edtech_app/features/privacy_and_policy/view/privacy_and_policy_page.dart'
    as _i9;
import 'package:edtech_app/features/profile/view/profile_page.dart' as _i10;
import 'package:edtech_app/features/quiz/view/quiz_page.dart' as _i11;
import 'package:edtech_app/features/quiz_progress/view/quiz_progress_page.dart'
    as _i12;
import 'package:edtech_app/features/terms_and_conditions/view/terms_and_conditions_page.dart'
    as _i13;
import 'package:edtech_app/features/update_user/view/update_user_page.dart'
    as _i14;
import 'package:edtech_app/features/verify_code/view/verify_code_page.dart'
    as _i15;
import 'package:edtech_app/features/video_player/view/video_player_page.dart'
    as _i16;
import 'package:edtech_app/features/videos/view/videos_page.dart' as _i17;
import 'package:flutter/material.dart' as _i19;

/// generated route for
/// [_i1.BlogDetailsPage]
class BlogDetailsRoute extends _i18.PageRouteInfo<BlogDetailsRouteArgs> {
  BlogDetailsRoute({
    _i19.Key? key,
    required String title,
    required String fullDescription,
    required String authorName,
    required String timeAgo,
    String? authorImageUrl,
    List<_i18.PageRouteInfo>? children,
  }) : super(
         BlogDetailsRoute.name,
         args: BlogDetailsRouteArgs(
           key: key,
           title: title,
           fullDescription: fullDescription,
           authorName: authorName,
           timeAgo: timeAgo,
           authorImageUrl: authorImageUrl,
         ),
         initialChildren: children,
       );

  static const String name = 'BlogDetailsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BlogDetailsRouteArgs>();
      return _i1.BlogDetailsPage(
        key: args.key,
        title: args.title,
        fullDescription: args.fullDescription,
        authorName: args.authorName,
        timeAgo: args.timeAgo,
        authorImageUrl: args.authorImageUrl,
      );
    },
  );
}

class BlogDetailsRouteArgs {
  const BlogDetailsRouteArgs({
    this.key,
    required this.title,
    required this.fullDescription,
    required this.authorName,
    required this.timeAgo,
    this.authorImageUrl,
  });

  final _i19.Key? key;

  final String title;

  final String fullDescription;

  final String authorName;

  final String timeAgo;

  final String? authorImageUrl;

  @override
  String toString() {
    return 'BlogDetailsRouteArgs{key: $key, title: $title, fullDescription: $fullDescription, authorName: $authorName, timeAgo: $timeAgo, authorImageUrl: $authorImageUrl}';
  }
}

/// generated route for
/// [_i2.BlogsPage]
class BlogsRoute extends _i18.PageRouteInfo<void> {
  const BlogsRoute({List<_i18.PageRouteInfo>? children})
    : super(BlogsRoute.name, initialChildren: children);

  static const String name = 'BlogsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i2.BlogsPage();
    },
  );
}

/// generated route for
/// [_i3.CounterPage]
class CounterRoute extends _i18.PageRouteInfo<void> {
  const CounterRoute({List<_i18.PageRouteInfo>? children})
    : super(CounterRoute.name, initialChildren: children);

  static const String name = 'CounterRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return _i18.DeferredWidget(_i3.loadLibrary, () => _i3.CounterPage());
    },
  );
}

/// generated route for
/// [_i4.ForumsPage]
class ForumsRoute extends _i18.PageRouteInfo<void> {
  const ForumsRoute({List<_i18.PageRouteInfo>? children})
    : super(ForumsRoute.name, initialChildren: children);

  static const String name = 'ForumsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i4.ForumsPage();
    },
  );
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i18.PageRouteInfo<void> {
  const HomeRoute({List<_i18.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomePage();
    },
  );
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i18.PageRouteInfo<void> {
  const LoginRoute({List<_i18.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginPage();
    },
  );
}

/// generated route for
/// [_i7.NavbarPage]
class NavbarRoute extends _i18.PageRouteInfo<void> {
  const NavbarRoute({List<_i18.PageRouteInfo>? children})
    : super(NavbarRoute.name, initialChildren: children);

  static const String name = 'NavbarRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return _i18.DeferredWidget(_i7.loadLibrary, () => _i7.NavbarPage());
    },
  );
}

/// generated route for
/// [_i8.OnboardingPage]
class OnboardingRoute extends _i18.PageRouteInfo<void> {
  const OnboardingRoute({List<_i18.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i8.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i9.PrivacyAndPolicyPage]
class PrivacyAndPolicyRoute extends _i18.PageRouteInfo<void> {
  const PrivacyAndPolicyRoute({List<_i18.PageRouteInfo>? children})
    : super(PrivacyAndPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyAndPolicyRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i9.PrivacyAndPolicyPage();
    },
  );
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i18.PageRouteInfo<void> {
  const ProfileRoute({List<_i18.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i10.ProfilePage();
    },
  );
}

/// generated route for
/// [_i11.QuizPage]
class QuizRoute extends _i18.PageRouteInfo<QuizRouteArgs> {
  QuizRoute({
    _i19.Key? key,
    required String questionId,
    List<_i18.PageRouteInfo>? children,
  }) : super(
         QuizRoute.name,
         args: QuizRouteArgs(key: key, questionId: questionId),
         initialChildren: children,
       );

  static const String name = 'QuizRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizRouteArgs>();
      return _i11.QuizPage(key: args.key, questionId: args.questionId);
    },
  );
}

class QuizRouteArgs {
  const QuizRouteArgs({this.key, required this.questionId});

  final _i19.Key? key;

  final String questionId;

  @override
  String toString() {
    return 'QuizRouteArgs{key: $key, questionId: $questionId}';
  }
}

/// generated route for
/// [_i12.QuizProgressPage]
class QuizProgressRoute extends _i18.PageRouteInfo<QuizProgressRouteArgs> {
  QuizProgressRoute({
    _i19.Key? key,
    required String videoId,
    List<_i18.PageRouteInfo>? children,
  }) : super(
         QuizProgressRoute.name,
         args: QuizProgressRouteArgs(key: key, videoId: videoId),
         initialChildren: children,
       );

  static const String name = 'QuizProgressRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizProgressRouteArgs>();
      return _i12.QuizProgressPage(key: args.key, videoId: args.videoId);
    },
  );
}

class QuizProgressRouteArgs {
  const QuizProgressRouteArgs({this.key, required this.videoId});

  final _i19.Key? key;

  final String videoId;

  @override
  String toString() {
    return 'QuizProgressRouteArgs{key: $key, videoId: $videoId}';
  }
}

/// generated route for
/// [_i13.TermsAndConditionsPage]
class TermsAndConditionsRoute
    extends _i18.PageRouteInfo<TermsAndConditionsRouteArgs> {
  TermsAndConditionsRoute({
    _i19.Key? key,
    required String url,
    List<_i18.PageRouteInfo>? children,
  }) : super(
         TermsAndConditionsRoute.name,
         args: TermsAndConditionsRouteArgs(key: key, url: url),
         initialChildren: children,
       );

  static const String name = 'TermsAndConditionsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TermsAndConditionsRouteArgs>();
      return _i13.TermsAndConditionsPage(key: args.key, url: args.url);
    },
  );
}

class TermsAndConditionsRouteArgs {
  const TermsAndConditionsRouteArgs({this.key, required this.url});

  final _i19.Key? key;

  final String url;

  @override
  String toString() {
    return 'TermsAndConditionsRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i14.UpdateUserPage]
class UpdateUserRoute extends _i18.PageRouteInfo<void> {
  const UpdateUserRoute({List<_i18.PageRouteInfo>? children})
    : super(UpdateUserRoute.name, initialChildren: children);

  static const String name = 'UpdateUserRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i14.UpdateUserPage();
    },
  );
}

/// generated route for
/// [_i15.VerifyCodePage]
class VerifyCodeRoute extends _i18.PageRouteInfo<void> {
  const VerifyCodeRoute({List<_i18.PageRouteInfo>? children})
    : super(VerifyCodeRoute.name, initialChildren: children);

  static const String name = 'VerifyCodeRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i15.VerifyCodePage();
    },
  );
}

/// generated route for
/// [_i16.VideoPlayerPage]
class VideoPlayerRoute extends _i18.PageRouteInfo<VideoPlayerRouteArgs> {
  VideoPlayerRoute({
    _i19.Key? key,
    required String videoTitle,
    required String videoUrl,
    required String whatYouWillLearn,
    required String videoId,
    List<_i18.PageRouteInfo>? children,
  }) : super(
         VideoPlayerRoute.name,
         args: VideoPlayerRouteArgs(
           key: key,
           videoTitle: videoTitle,
           videoUrl: videoUrl,
           whatYouWillLearn: whatYouWillLearn,
           videoId: videoId,
         ),
         initialChildren: children,
       );

  static const String name = 'VideoPlayerRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VideoPlayerRouteArgs>();
      return _i16.VideoPlayerPage(
        key: args.key,
        videoTitle: args.videoTitle,
        videoUrl: args.videoUrl,
        whatYouWillLearn: args.whatYouWillLearn,
        videoId: args.videoId,
      );
    },
  );
}

class VideoPlayerRouteArgs {
  const VideoPlayerRouteArgs({
    this.key,
    required this.videoTitle,
    required this.videoUrl,
    required this.whatYouWillLearn,
    required this.videoId,
  });

  final _i19.Key? key;

  final String videoTitle;

  final String videoUrl;

  final String whatYouWillLearn;

  final String videoId;

  @override
  String toString() {
    return 'VideoPlayerRouteArgs{key: $key, videoTitle: $videoTitle, videoUrl: $videoUrl, whatYouWillLearn: $whatYouWillLearn, videoId: $videoId}';
  }
}

/// generated route for
/// [_i17.VideosPage]
class VideosRoute extends _i18.PageRouteInfo<VideosRouteArgs> {
  VideosRoute({
    _i19.Key? key,
    required String subject,
    required String subjectId,
    List<_i18.PageRouteInfo>? children,
  }) : super(
         VideosRoute.name,
         args: VideosRouteArgs(
           key: key,
           subject: subject,
           subjectId: subjectId,
         ),
         initialChildren: children,
       );

  static const String name = 'VideosRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VideosRouteArgs>();
      return _i17.VideosPage(
        key: args.key,
        subject: args.subject,
        subjectId: args.subjectId,
      );
    },
  );
}

class VideosRouteArgs {
  const VideosRouteArgs({
    this.key,
    required this.subject,
    required this.subjectId,
  });

  final _i19.Key? key;

  final String subject;

  final String subjectId;

  @override
  String toString() {
    return 'VideosRouteArgs{key: $key, subject: $subject, subjectId: $subjectId}';
  }
}
