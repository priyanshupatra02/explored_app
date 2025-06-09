import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:platform_info/platform_info.dart';

class AppLoader extends StatelessWidget {
  final Color androidBgColor;
  final Color iosBgColor;
  final Color progressColor;
  final double size;
  const AppLoader({
    super.key,
    this.androidBgColor = AppColors.kGrey800,
    this.iosBgColor = AppColors.kPrimaryColor,
    this.progressColor = AppColors.kGrey300,
    this.size = 18,
  });

  @override
  Widget build(BuildContext context) {
    return (Platform.I.iOS || Platform.I.android)
        ? SizedBox(
            height: size,
            width: size,
            child: CircularProgressIndicator(
              strokeWidth: 1,
              backgroundColor: androidBgColor,
              color: progressColor,
            ),
          )
        : CircularProgressIndicator.adaptive(
            // strokeWidth: 1,
            backgroundColor: iosBgColor,
            // valueColor: AlwaysStoppedAnimation<Color>(progressColor),
          );
  }
}
