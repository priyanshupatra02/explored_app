import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';

class NumberedBulletWidget extends StatelessWidget {
  final String questionNumber;
  const NumberedBulletWidget({
    super.key,
    required this.questionNumber,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 14,
      backgroundColor: AppColors.kPrimaryColor,
      child: Center(
        child: Text(
          questionNumber,
          style: TextStyle(
            color: AppColors.kPrimaryWhiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
