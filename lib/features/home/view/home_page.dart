import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/resource.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/features/blogs/view/widget/search_bar_widget.dart';
import 'package:edtech_app/features/home/controller/pod/subjects_pod.dart';
import 'package:edtech_app/shared/algorithms/algorithms.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:edtech_app/shared/widget/app_icons_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: 'Hello, \n',
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                TextSpan(
                  text: Algorithms.getFirstTwoWords(
                    'Arnav Herlekar Amet ea adipisicing velit aliqua voluptate officia aliquip mollit.'
                        .hardCoded,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ],
            ),
          ).pOnly(left: 20),
          actions: [
            AppIconsWidget(
              icon: HugeIcon(
                icon: AppIcons.strokeRoundedNotification03,
                color: AppColors.kPrimaryColor,
              ),
            ).pOnly(right: 20),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //heading text
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  'What subject do you want to improve today?',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: AppColors.kPrimaryColor,
                        height: 1.3,
                      ),
                ),
              ),
              40.heightBox,
              //searchbar
              SearchBarWidget(hintText: 'Search here'),
              40.heightBox,
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: 'Recommended \n',
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                    TextSpan(
                      text: Algorithms.getFirstTwoWords(
                        'video categories'.hardCoded,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              20.heightBox,
              Consumer(
                builder: (context, ref, child) {
                  final subjectsAsync = ref.watch(subjectProvider);
                  return subjectsAsync.easyWhen(
                    data: (subjectsModel) {
                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        itemCount: subjectsModel.subjectList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.navigateTo(
                                VideosRoute(
                                  subject: subjectsModel.subjectList[index].name,
                                  subjectId: subjectsModel.subjectList[index].documentId,
                                ),
                              );
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.width * 0.16,
                              width: MediaQuery.of(context).size.width * 0.11,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: AppColors.kLightSecondaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(R.ASSETS_ILLUSTRATION_PHYSICS_ILLUSTRATION_SVG),
                                  30.heightBox,
                                  Text(
                                    subjectsModel.subjectList[index].name,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: AppColors.kPrimaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
