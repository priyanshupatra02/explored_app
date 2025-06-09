import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/login/controller/pod/register_user_pod.dart';
import 'package:edtech_app/features/login/controller/state/register_user_state.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:edtech_app/shared/widget/buttons/primary_action_button.dart';
import 'package:edtech_app/shared/widget/custom_loaders/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class SignupButton extends ConsumerWidget {
  final void Function() onPressed;
  const SignupButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerUserAsync = ref.watch(registerUserProvider);
    return registerUserAsync.easyWhen(
      data: (registerUserState) {
        return switch (registerUserState) {
          InitialRegisterUserState() => PrimaryActionButton(
              labelText: 'Signup',
              isIcon: true,
              icon: HugeIcon(
                icon: AppIcons.strokeRoundedArrowRight02,
                color: AppColors.kLightSecondaryColor,
              ),
              onPressed: onPressed,
            ),
          RegisteringUserState() => AppLoader(),
          RegisteredUserState() => PrimaryActionButton(
              labelText: 'Welcome',
              isIcon: true,
              icon: HugeIcon(
                icon: AppIcons.strokeRoundedArrowRight02,
                color: AppColors.kLightSecondaryColor,
              ),
              onPressed: () {},
            ),
          NotRegisteredUserState() => PrimaryActionButton(
              labelText: 'Retry',
              isIcon: true,
              icon: HugeIcon(
                icon: AppIcons.strokeRoundedArrowRight02,
                color: AppColors.kLightSecondaryColor,
              ),
              onPressed: onPressed,
            ),
          RegisterUserErrorState() => PrimaryActionButton(
              labelText: 'Unable to signup',
              isIcon: true,
              icon: HugeIcon(
                icon: AppIcons.strokeRoundedArrowRight02,
                color: AppColors.kLightSecondaryColor,
              ),
              onPressed: onPressed,
            ),
        };
      },
    );
  }
}
