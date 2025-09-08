import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/login/controller/pod/login_user_pod.dart';
import 'package:edtech_app/features/login/controller/state/login_user_state.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:edtech_app/shared/widget/buttons/primary_action_button.dart';
import 'package:edtech_app/shared/widget/custom_loaders/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class LoginButton extends ConsumerStatefulWidget {
  final void Function()? loginUser;
  const LoginButton({
    super.key,
    required this.loginUser,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginButtonState();
}

class _LoginButtonState extends ConsumerState<LoginButton> {
  @override
  Widget build(BuildContext context) {
    final loginUserStateAsync = ref.watch(loginUserProvider);
    return loginUserStateAsync.easyWhen(
      data: (loginUserState) {
        return switch (loginUserState) {
          InitialLoginUserState() => PrimaryActionButton(
              labelText: 'Login',
              isIcon: true,
              icon: HugeIcon(
                icon: AppIcons.strokeRoundedArrowRight02,
                color: AppColors.kLightSecondaryColor,
              ),
              onPressed: widget.loginUser,
            ),
          LoggingInUserState() => AppLoader(),
          LoggedInState() => PrimaryActionButton(
              labelText: 'Logged In',
              isIcon: true,
              icon: HugeIcon(
                icon: AppIcons.strokeRoundedArrowRight02,
                color: AppColors.kLightSecondaryColor,
              ),
              onPressed: () {},
            ),
          NotLoggedInUserState() => PrimaryActionButton(
              labelText: 'Retry',
              isIcon: true,
              icon: HugeIcon(
                icon: AppIcons.strokeRoundedArrowRight02,
                color: AppColors.kLightSecondaryColor,
              ),
              onPressed: widget.loginUser,
            ),
          LoginUserErrorState() => PrimaryActionButton(
              labelText: 'Unable to login, Retry',
              isIcon: true,
              icon: HugeIcon(
                icon: AppIcons.strokeRoundedArrowRight02,
                color: AppColors.kLightSecondaryColor,
              ),
              onPressed: widget.loginUser,
            ),
        };
      },
    );
  }
}
