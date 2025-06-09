import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Choose Your Plan",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.kPrimaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
              ),
        ),
        SizedBox(height: 10),
        Text(
          "Unlock your learning potential",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
