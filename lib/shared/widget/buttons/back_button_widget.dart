import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.maybePop();
      },
      child: HugeIcon(
        icon: AppIcons.strokeRoundedArrowLeft01,
        color: AppColors.kPrimaryColor,
      ),
    );
  }
}
