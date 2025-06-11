import 'dart:async';

import 'package:edtech_app/data/model/blog_comment_response_model.dart';
import 'package:edtech_app/data/network/api_helper_pod.dart';
import 'package:edtech_app/features/blog_comment_dialog/controller/pod/blog_comment_pod.dart';
import 'package:edtech_app/features/blog_comment_dialog/controller/state/add_blog_comment_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddBlogCommentAsyncNotifier extends AutoDisposeAsyncNotifier<BlogCommentState> {
  @override
  FutureOr<BlogCommentState> build() {
    return const InitialBlogCommentState();
  }

  Future<void> addBlogComment({
    required String comment,
    required int blogId,
    required void Function(BlogCommentResponseModel blogCommentResponseModel) onCommentAdded,
  }) async {
    state = const AsyncData(CommentingState());
    state = await AsyncValue.guard(
      () async {
        final blogCommentResult = await ref.watch(apiHelperProvider).addBlogComment(
              comment: comment,
              blogId: blogId,
            );

        return blogCommentResult.when(
          (blogCommentResponse) async {
            if (blogCommentResponse.data?.id != null) {
              // Refresh the comments list BEFORE calling the callback
              ref.invalidate(blogCommentsProvider(blogId));
              // Call the success callback
              onCommentAdded(blogCommentResponse);

              return const CommentedState();
            } else {
              return const NotCommentedState();
            }
          },
          (error) => BlogCommentErrorState(
            error.errorMessage,
          ),
        );
      },
    );
  }
}
