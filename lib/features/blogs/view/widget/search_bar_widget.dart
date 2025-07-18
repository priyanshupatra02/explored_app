import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/blogs/controller/pod/blog_search_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SearchBarWidget extends ConsumerWidget {
  final String hintText;
  const SearchBarWidget({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double fontSize = ResponsiveValue<double>(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: Theme.of(context).textTheme.bodyLarge?.fontSize),
        Condition.equals(name: TABLET, value: Theme.of(context).textTheme.titleMedium?.fontSize),
        Condition.equals(name: DESKTOP, value: Theme.of(context).textTheme.titleLarge?.fontSize),
        Condition.equals(name: '4K', value: Theme.of(context).textTheme.titleLarge?.fontSize),
      ],
    ).value;
    // return FormBuilderTypeAhead<TeachersList>(
    //   name: 'search-teachers',
    //   debounceDuration: Duration(milliseconds: 200),
    //   customTextField: TextField(
    //     style: TextStyle(
    //       color: AppColors.kPrimaryWhiteColor,
    //     ),
    //   ),
    //   decoration: InputDecoration(
    //     contentPadding: EdgeInsets.all(20),
    //     isDense: true,
    //     prefixIcon: HugeIcon(
    //       icon: AppIcons.strokeRoundedSearch01,
    //       color: AppColors.kPrimaryColor,
    //       size: 24.0,
    //     ),
    //     border: OutlineInputBorder(
    //       borderSide: BorderSide(color: AppColors.kBlue500.withOpacity(0.5)),
    //       borderRadius: BorderRadius.all(Radius.circular(12.0)),
    //     ),
    //     enabledBorder: OutlineInputBorder(
    //       borderSide: BorderSide(color: AppColors.kBlue500.withOpacity(0.5)),
    //       borderRadius: BorderRadius.all(Radius.circular(12.0)),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderSide: BorderSide(color: AppColors.kBlue500.withOpacity(0.5)),
    //       borderRadius: BorderRadius.all(Radius.circular(12.0)),
    //     ),
    //     hintText: hintText,
    //     fillColor: AppColors.kBlue500.withOpacity(0.3),
    //     hintStyle: TextStyle(
    //       color: AppColors.kBlue300,
    //       fontSize: fontSize,
    //       fontWeight: FontWeight.w500,
    //     ),
    //   ),
    //   selectionToTextTransformer: (TeachersList? teachersList) {
    //     // Convert teacher search result of teacherList to a String
    //     return teachersList?.personalDetails?.name ?? 'No results found';
    //   },
    //   suggestionsCallback: (input) async {
    //     final teachersList = await ref.watch(searchTeacherProvider(input).future);
    //     return teachersList;
    //   },
    //   itemBuilder: (context, suggestion) {
    //     return GestureDetector(
    //       onTap: () {
    //         context.navigateTo(
    //           TeacherProfileDetailsRoute(teacherId: suggestion.userId!),
    //         );
    //       },
    //       child: TeacherListSingleCard(
    //         teacherId: suggestion.userId!,
    //         callStatus: 'callStatus',
    //         imageUrl: suggestion.personalDetails!.profile!.location!,
    //         name: suggestion.personalDetails!.name!,
    //         allSkill: suggestion.skillDetails!.subjectsKnown!.join(', '),
    //         experienceInYears: suggestion.skillDetails!.experienceInYear!,
    //         charge: suggestion.skillDetails!.chatRatePerMin!,
    //         chatStatus: 'chatStatus',
    //         chatWaitTime: DateTime.now(),
    //         isCall: false,
    //         rating: 0,
    //       ).pOnly(bottom: 10),
    //     );
    //   },
    // );
    return TextField(
      onChanged: (value) {
        ref.read(blogSearchQueryProvider.notifier).state = value;
      },
      style: TextStyle(
        color: AppColors.kPrimaryColor,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(14),
        isDense: true,
        filled: true,
        prefixIcon: HugeIcon(
          icon: AppIcons.strokeRoundedSearch01,
          color: AppColors.kPrimaryColor,
          size: 20.0,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        hintText: hintText,
        fillColor: AppColors.kLightSecondaryColor,
        hintStyle: TextStyle(
          color: AppColors.kPrimaryColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
