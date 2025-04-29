import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/shared/widget/buttons/primary_action_button.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryActionButton(
      labelText: 'Signup',
      isIcon: true,
      icon: HugeIcon(
        icon: AppIcons.strokeRoundedArrowRight02,
        color: AppColors.kLightSecondaryColor,
      ),
      onPressed: () {
        // if (updateFormKey.currentState!.validate()) {}
        context.navigateTo(UpdateUserRoute());
      },
    );
  }
}
