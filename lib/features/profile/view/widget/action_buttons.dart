import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/profile/view/widget/animated_button.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedButton(
          text: 'Upgrade to Premium',
          isPrimary: true,
          delay: 0,
          textColor: AppColors.kPrimaryWhiteColor,
        ),
        // SizedBox(height: 12),
        // AnimatedButton(
        //   text: 'Edit Profile',
        //   isPrimary: false,
        //   delay: 100,
        // ),
      ],
    );
  }
}
