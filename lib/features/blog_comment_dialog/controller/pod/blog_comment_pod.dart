import 'package:edtech_app/data/model/blog_comment_model.dart';
import 'package:edtech_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogCommentsProvider = FutureProvider.autoDispose.family<BlogCommentModel, int>(
  (ref, blogId) async {
    final result = await ref.watch(apiHelperProvider).getBlogComments(blogId: blogId);
    return result.when(
      (blogResponse) {
        return blogResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "blogCommentsProvider",
);
