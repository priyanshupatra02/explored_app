import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';

class UserAvatarWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final double size;

  const UserAvatarWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    String initials = '${firstName.isNotEmpty ? firstName[0] : ''}'
        '${lastName.isNotEmpty ? lastName[0] : ''}';

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.kPrimaryColor,
            AppColors.kPrimaryColor.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(size / 2),
        boxShadow: [
          BoxShadow(
            color: AppColors.kPrimaryColor.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          initials.toUpperCase(),
          style: TextStyle(
            fontSize: size * 0.4,
            fontWeight: FontWeight.bold,
            color: AppColors.kPrimaryWhiteColor,
          ),
        ),
      ),
    );
  }
}
