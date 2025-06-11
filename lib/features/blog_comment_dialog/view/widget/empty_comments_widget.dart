import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:velocity_x/velocity_x.dart';

class EmptyCommentsWidget extends StatelessWidget {
  const EmptyCommentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.kLightSecondaryColor.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: HugeIcon(
                icon: AppIcons.strokeRoundedComment01,
                color: AppColors.kGrey500,
                size: 40,
              ),
            ),
          ),
          24.heightBox,
          Text(
            'No Comments Yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.kPrimaryColor,
            ),
          ),
          8.heightBox,
          Text(
            'Be the first to share your thoughts!',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.kGrey500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
