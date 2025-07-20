import 'package:edtech_app/features/home/controller/pod/get_profile_pod.dart';
import 'package:edtech_app/features/profile/view/widget/animated_avatar.dart';
import 'package:edtech_app/features/profile/view/widget/user_designation_widget.dart';
import 'package:edtech_app/features/profile/view/widget/username_widget.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Consumer(
      builder: (context, ref, child) {
        final getProfileAsync = ref.watch(getProfileProvider);
        return getProfileAsync.easyWhen(
          data: (profileResponse) {
            return Column(
              children: [
                AnimatedAvatar(
                  userName: profileResponse.firstName!,
                ),
                SizedBox(height: 16),
                UsernameWidget(
                  textTheme: textTheme,
                  firstName: profileResponse.firstName!,
                ),
                SizedBox(height: 4),
                UserDesignationWidget(textTheme: textTheme)
              ],
            );
          },
        );
      },
    );
  }
}
