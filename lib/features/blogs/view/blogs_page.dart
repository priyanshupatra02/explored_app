import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/features/blogs/controller/pod/blogs_categories_pod.dart';
import 'package:edtech_app/features/blogs/controller/pod/blogs_pod.dart';
import 'package:edtech_app/features/blogs/view/widget/blogs_card_widget.dart';
import 'package:edtech_app/features/blogs/view/widget/search_bar_widget.dart';
import 'package:edtech_app/shared/algorithms/algorithms.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:edtech_app/shared/widget/app_icons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class BlogsPage extends StatelessWidget {
  const BlogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlogsView();
  }
}

class BlogsView extends StatefulWidget {
  const BlogsView({super.key});

  @override
  State<BlogsView> createState() => _BlogsViewState();
}

class _BlogsViewState extends State<BlogsView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          AppIconsWidget(
            icon: HugeIcon(
              icon: AppIcons.strokeRoundedBookmark02,
              color: AppColors.kPrimaryColor,
            ),
          ).pOnly(right: 20),
        ],
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
            final blogsAsync = ref.watch(blogsProvider);
            final blogsCategoriesAsync = ref.watch(blogsCategoriesProvider);
            return blogsAsync.easyWhen(
              data: (blogsResponse) {
                return Column(
                  children: [
                    30.heightBox,
                    SearchBarWidget(hintText: 'Search here....'.hardCoded).centered(),
                    30.heightBox,
                    TabBar(
                      tabAlignment: TabAlignment.start, //for removing extra space from left
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      indicatorColor: AppColors.kPrimaryColor,
                      labelColor: AppColors.kPrimaryColor,
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold, // Bold text for selected tab
                            letterSpacing: 0.5,
                          ),
                      unselectedLabelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.normal, // Regular text for unselected tabs
                            letterSpacing: 0.5,
                          ),
                      overlayColor: WidgetStateProperty.all(Colors.transparent), //onclick tabcolor
                      tabs: [
                        Tab(text: 'For you'),
                        Tab(text: 'Physics'),
                        Tab(text: 'Chemistry'),
                        Tab(text: 'Maths'),
                        Tab(text: 'Biology'),
                        Tab(text: 'Ai'),
                        Tab(text: 'Commerce'),
                        Tab(text: 'Finance'),
                      ],
                    ),
                    blogsCategoriesAsync.easyWhen(
                      data: (blogsCategories) {
                        return Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: blogsResponse.bloglist.length,
                                itemBuilder: (context, index) {
                                  //get the current datetime
                                  DateTime now = DateTime.now();
                                  //calculate the difference
                                  Duration difference =
                                      now.difference(blogsResponse.bloglist[index].createdAt);
                                  return BlogsCardWidget(
                                    authorName: blogsResponse.bloglist[index].user.firstName,
                                    timeAgo:
                                        Algorithms.getTimeAgo(difference: difference).toString(),
                                    title: blogsResponse.bloglist[index].title,
                                    // authorImageUrl:
                                    //     blogsResponse.bloglist[index].user.firstName,
                                    description: blogsResponse.bloglist[index].content,
                                    onReadMoreTap: () {
                                      context.navigateTo(
                                        BlogDetailsRoute(
                                          authorName: blogsResponse.bloglist[index].user.firstName,
                                          timeAgo: Algorithms.getTimeAgo(difference: difference)
                                              .toString(),
                                          title: blogsResponse.bloglist[index].title,
                                          // authorImageUrl:
                                          //     blogsResponse.bloglist[index].user.firstName,
                                          fullDescription: blogsResponse.bloglist[index].content,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              ...[
                                for (var blogCategory in blogsCategories.blogsCategoriesList)
                                  Center(
                                    child: Text(blogCategory.name),
                                  ),
                              ],
                            ],
                          ),
                        );
                      },
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
