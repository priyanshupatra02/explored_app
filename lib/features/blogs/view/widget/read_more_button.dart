import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/shared/widget/buttons/primary_action_button.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ReadMoreButton extends StatelessWidget {
  const ReadMoreButton({
    super.key,
    required this.onReadMoreTap,
  });

  final VoidCallback onReadMoreTap;

  @override
  Widget build(BuildContext context) {
    return PrimaryActionButton(
      labelText: 'Read more',
      isIcon: true,
      icon: HugeIcon(
        icon: AppIcons.strokeRoundedArrowRight02,
        color: AppColors.kLightSecondaryColor,
        size: 18,
      ),
      onPressed: onReadMoreTap,
    );
  }
}
