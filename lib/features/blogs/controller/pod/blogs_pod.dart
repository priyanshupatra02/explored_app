import 'package:edtech_app/data/model/blog_model.dart';
import 'package:edtech_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogsProvider = FutureProvider.autoDispose.family<BlogModel, String>(
  (ref, blogCategoryName) async {
    final result = await ref.watch(apiHelperProvider).getBlogs(blogCategoryName: blogCategoryName);
    return result.when(
      (blogsModel) {
        return blogsModel;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "blogsProvider",
);
