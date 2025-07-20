import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';

class UsernameWidget extends StatelessWidget {
  final String firstName;
  const UsernameWidget({
    super.key,
    required this.textTheme,
    required this.firstName,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      firstName,
      style: textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.kPrimaryColor,
        letterSpacing: 0.5,
      ),
    );
  }
}
