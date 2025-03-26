import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';

class HorizontalDividerWidget extends StatelessWidget {
  const HorizontalDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 35,
      thickness: 0.5,
      color: AppColors.kSecondaryColor,
    );
  }
}
