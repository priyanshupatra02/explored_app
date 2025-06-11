import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/features/blog_comment_dialog/controller/pod/blog_comment_pod.dart';
import 'package:edtech_app/features/blog_comment_dialog/view/widget/blog_comments_sheet.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class BlogCommentDialogPage extends StatelessWidget {
  final int blogId;
  final String blogTitle;
  const BlogCommentDialogPage({super.key, required this.blogId, required this.blogTitle});

  @override
  Widget build(BuildContext context) {
    return BlogCommentDialogView(
      blogId: blogId,
      blogTitle: blogTitle,
    );
  }
}

class BlogCommentDialogView extends StatelessWidget {
  final int blogId;
  final String blogTitle;
  const BlogCommentDialogView({super.key, required this.blogId, required this.blogTitle});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final blogCommentsAsync = ref.watch(
          blogCommentsProvider(blogId),
        );
        return blogCommentsAsync.easyWhen(
          data: (blogCommentsResponse) {
            return BlogCommentsSheet(
              blogId: blogId,
              blogTitle: blogTitle,
              comments: blogCommentsResponse.blogCommentData,
            );
          },
        );
      },
    );
  }
}
