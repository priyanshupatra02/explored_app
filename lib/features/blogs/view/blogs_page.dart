import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/features/blogs/view/widget/blogs_card_widget.dart';
import 'package:edtech_app/features/blogs/view/widget/search_bar_widget.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:edtech_app/shared/widget/app_icons_widget.dart';
import 'package:flutter/material.dart';
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
        child: Column(
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
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return BlogsCardWidget(
                        authorName: 'Arnav Herleker',
                        timeAgo: '2 hrs ago',
                        title: '5 tips to create a modern app UI design',
                        authorImageUrl:
                            'https://images.unsplash.com/photo-1543132220-3ec99c6094dc?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        description:
                            '''Recently I was given the task to “Modernize” my current companies app UI on android. The terms modern, young, cool, etc., are all quite vague. What makes a design modern or old ?''',
                        onReadMoreTap: () {
                          context.navigateTo(
                            BlogDetailsRoute(
                              authorName: 'Arnav Herleker',
                              timeAgo: '2 hrs ago',
                              title: '5 tips to create a modern app UI design',
                              authorImageUrl:
                                  'https://images.unsplash.com/photo-1543132220-3ec99c6094dc?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                              fullDescription:
                                  '''Recently I was given the task to “Modernize” my current companies app UI on android. The terms modern, young, cool, etc., are all quite vague. What makes a design modern or old ?''',
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Center(
                    child: Text('Physics'),
                  ),
                  Center(
                    child: Text('Chemistry'),
                  ),
                  Center(
                    child: Text('Maths'),
                  ),
                  Center(
                    child: Text('Biology'),
                  ),
                  Center(
                    child: Text('Ai'),
                  ),
                  Center(
                    child: Text('Commerce'),
                  ),
                  Center(
                    child: Text('Finance'),
                  ),
                ],
              ),
            ),
          ],
        ).px16(),
      ),
    );
  }
}
