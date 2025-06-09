import 'package:edtech_app/data/model/blog_categories_model.dart';
import 'package:edtech_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogsCategoriesProvider = FutureProvider.autoDispose<BlogsCategoriesModel>(
  (ref) async {
    final result = await ref.watch(apiHelperProvider).getBlogCategories();
    return result.when(
      (blogsCategoriesModel) {
        return blogsCategoriesModel;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "blogsCategoriesProvider",
);
