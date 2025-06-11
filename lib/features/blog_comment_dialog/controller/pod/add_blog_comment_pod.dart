import 'package:edtech_app/features/blog_comment_dialog/controller/notifier/add_blog_comment_notifier.dart';
import 'package:edtech_app/features/blog_comment_dialog/controller/state/add_blog_comment_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addBlogCommentProvider =
    AsyncNotifierProvider.autoDispose<AddBlogCommentAsyncNotifier, BlogCommentState>(
  AddBlogCommentAsyncNotifier.new,
  name: "addBlogCommentProvider",
);
