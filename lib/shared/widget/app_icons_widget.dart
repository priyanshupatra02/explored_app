import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppIconsWidget extends StatelessWidget {
  final Widget icon;
  const AppIconsWidget({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.kLightSecondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: icon,
    );
  }
}
