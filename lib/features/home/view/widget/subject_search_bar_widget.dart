import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/home/controller/pod/subject_search_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SubjectSearchBarWidget extends ConsumerWidget {
  final String hintText;
  const SubjectSearchBarWidget({
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
    
    return TextField(
      onChanged: (value) {
        ref.read(subjectSearchQueryProvider.notifier).state = value;
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