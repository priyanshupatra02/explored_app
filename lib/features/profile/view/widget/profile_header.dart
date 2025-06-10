import 'package:edtech_app/features/profile/view/widget/animated_avatar.dart';
import 'package:edtech_app/features/profile/view/widget/user_designation_widget.dart';
import 'package:edtech_app/features/profile/view/widget/username_widget.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        AnimatedAvatar(),
        SizedBox(height: 16),
        UsernameWidget(textTheme: textTheme),
        SizedBox(height: 4),
        UserDesignationWidget(textTheme: textTheme)
      ],
    );
  }
}
