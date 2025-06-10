import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/features/blogs/controller/pod/blog_category_state_provider.dart';
import 'package:edtech_app/features/blogs/controller/pod/blogs_categories_pod.dart';
import 'package:edtech_app/features/blogs/controller/pod/blogs_pod.dart';
import 'package:edtech_app/features/blogs/view/widget/blogs_card_widget.dart';
import 'package:edtech_app/features/blogs/view/widget/search_bar_widget.dart';
import 'package:edtech_app/shared/algorithms/algorithms.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class BlogsPage extends StatelessWidget {
  const BlogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlogsView();
  }
}

class BlogsView extends ConsumerStatefulWidget {
  const BlogsView({super.key});

  @override
  ConsumerState<BlogsView> createState() => _BlogsViewState();
}

class _BlogsViewState extends ConsumerState<BlogsView> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController != null) {
      final blogsCategoriesAsync = ref.read(blogsCategoriesProvider);
      blogsCategoriesAsync.whenData((blogCategoriesResponse) {
        if (_tabController!.index < blogCategoriesResponse.blogsCategoriesList.length) {
          final selectedCategory =
              blogCategoriesResponse.blogsCategoriesList[_tabController!.index];
          // Update the category state which will trigger blogs reload
          ref.read(blogCategoryPod.notifier).state = selectedCategory.name;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Blogs',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: AppColors.kPrimaryColor,
              ),
        ),
      ),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final blogsCategoriesAsync = ref.watch(blogsCategoriesProvider);

            return blogsCategoriesAsync.easyWhen(
              data: (blogCategoriesResponse) {
                final tabLength = blogCategoriesResponse.blogsCategoriesList.length;

                // Only create a new TabController if it doesn't exist or length changed
                if (_tabController == null || _tabController!.length != tabLength) {
                  _tabController?.dispose();
                  _tabController = TabController(length: tabLength, vsync: this);

                  // Add listener for tab changes
                  _tabController!.addListener(_onTabChanged);

                  // Set initial category
                  if (blogCategoriesResponse.blogsCategoriesList.isNotEmpty) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ref.read(blogCategoryPod.notifier).state =
                          blogCategoriesResponse.blogsCategoriesList[0].name;
                    });
                  }
                }

                return Column(
                  children: [
                    30.heightBox,
                    SearchBarWidget(hintText: 'Search here....'.hardCoded).centered(),
                    30.heightBox,
                    TabBar(
                      tabAlignment: TabAlignment.start,
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      indicatorColor: AppColors.kPrimaryColor,
                      labelColor: AppColors.kPrimaryColor,
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                      unselectedLabelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.5,
                          ),
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      tabs: blogCategoriesResponse.blogsCategoriesList
                          .map((category) => Tab(text: category.name))
                          .toList(),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: blogCategoriesResponse.blogsCategoriesList.map((category) {
                          return Consumer(
                            builder: (context, ref, child) {
                              // Watch blogs for this specific category
                              final blogsAsync = ref.watch(blogsProvider(category.name));

                              return blogsAsync.easyWhen(
                                data: (blogsResponse) {
                                  if (blogsResponse.blogList.isEmpty) {
                                    return Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.article_outlined,
                                            size: 64,
                                            color: Colors.grey[400],
                                          ),
                                          16.heightBox,
                                          Text(
                                            'No blogs found for ${category.name}',
                                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                                  color: Colors.grey[600],
                                                ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }

                                  return ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: blogsResponse.blogList.length,
                                    itemBuilder: (context, index) {
                                      final blog = blogsResponse.blogList[index];
                                      DateTime now = DateTime.now();
                                      Duration difference = now.difference(blog.createdAt);

                                      return BlogsCardWidget(
                                        authorName: blog.user.firstName,
                                        timeAgo: Algorithms.getTimeAgo(difference: difference)
                                            .toString(),
                                        title: blog.title,
                                        description: blog.content,
                                        onReadMoreTap: () {
                                          context.navigateTo(
                                            BlogDetailsRoute(
                                              authorName: blog.user.firstName,
                                              timeAgo: Algorithms.getTimeAgo(difference: difference)
                                                  .toString(),
                                              title: blog.title,
                                              fullDescription: blog.content,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ).px16();
              },
            );
          },
        ),
      ),
    );
  }
}
