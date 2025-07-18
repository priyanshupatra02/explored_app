import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/features/home/controller/pod/get_profile_pod.dart';
import 'package:edtech_app/features/home/controller/pod/subject_search_pod.dart';
import 'package:edtech_app/features/home/controller/pod/subjects_pod.dart';
import 'package:edtech_app/features/home/view/widget/subject_search_bar_widget.dart';
import 'package:edtech_app/shared/algorithms/algorithms.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:edtech_app/shared/widget/cache_network_image_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          flexibleSpace: Consumer(
            builder: (context, ref, child) {
              final getprofileAsync = ref.watch(getProfileProvider);
              return getprofileAsync.easyWhen(
                data: (profileResponse) {
                  return RichText(
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
                            profileResponse.firstName!,
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
                  ).pOnly(left: 20);
                },
              );
            },
          ),
          // actions: [
          //   AppIconsWidget(
          //     icon: HugeIcon(
          //       icon: AppIcons.strokeRoundedNotification03,
          //       color: AppColors.kPrimaryColor,
          //     ),
          //   ).pOnly(right: 20),
          // ],
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
              SubjectSearchBarWidget(hintText: 'Search here'),
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
                      return Consumer(
                        builder: (context, ref, child) {
                          final searchQuery = ref.watch(subjectSearchQueryProvider);

                          // Filter subjects based on search query
                          final filteredSubjects = searchQuery.isEmpty
                              ? subjectsModel.subjectList!
                              : subjectsModel.subjectList!.where((subject) {
                                  return subject.name!
                                      .toLowerCase()
                                      .contains(searchQuery.toLowerCase());
                                }).toList();

                          if (filteredSubjects.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    searchQuery.isEmpty ? Icons.subject_outlined : Icons.search_off,
                                    size: 64,
                                    color: Colors.grey[400],
                                  ),
                                  16.heightBox,
                                  Text(
                                    searchQuery.isEmpty
                                        ? 'No subjects available'
                                        : 'No subjects found matching "$searchQuery"',
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          color: Colors.grey[600],
                                        ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: filteredSubjects.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            itemBuilder: (context, index) {
                              final subject = filteredSubjects[index];
                              return GestureDetector(
                                onTap: () {
                                  context.navigateTo(
                                    VideosRoute(
                                      subject: subject.name!,
                                      subjectId: subject.documentId!,
                                    ),
                                  );
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.width * 0.16,
                                  width: MediaQuery.of(context).size.width * 0.11,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: AppColors.kLightSecondaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: CacheNetworkImageWidget(
                                          imageUrl: subject.imageUrl,
                                          width: double.infinity,
                                          height: MediaQuery.of(context).size.height * 0.12,
                                          fit: BoxFit.cover,
                                          placeholder: Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.kGrey200,
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.image_outlined,
                                                size: 30,
                                                color: AppColors.kGrey500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      20.heightBox,
                                      Text(
                                        subject.name!,
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
