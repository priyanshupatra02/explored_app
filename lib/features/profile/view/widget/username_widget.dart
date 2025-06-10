import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/home/controller/pod/get_profile_pod.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsernameWidget extends StatelessWidget {
  const UsernameWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final getProfileAsync = ref.watch(getProfileProvider);
        return getProfileAsync.easyWhen(
          data: (profileResponse) {
            return Text(
              profileResponse.firstName!,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.kPrimaryColor,
                letterSpacing: 0.5,
              ),
            );
          },
        );
      },
    );
  }
}
