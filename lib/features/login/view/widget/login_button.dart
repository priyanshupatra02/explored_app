import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/login/controller/pod/login_user_pod.dart';
import 'package:edtech_app/features/login/controller/state/login_user_state.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:edtech_app/shared/widget/buttons/primary_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

// class LoginButton extends ConsumerWidget {
//   final void Function()? loginUser;
//   final String email;
//   final String password;
//   const LoginButton({
//     super.key,
//     required this.loginUser,
//     required this.email,
//     required this.password,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final loginUserStateAsync = ref.watch(
//       loginUserProvider(
//         LoginUserParams(
//           email: email,
//           password: password,
//         ),
//       ),
//     );
//     return loginUserStateAsync.easyWhen(
//       data: (loginUserState) {
//         return switch (loginUserState) {
//           InitialLoginUserState() => PrimaryActionButton(
//               labelText: 'Login',
//               isIcon: true,
//               icon: HugeIcon(
//                 icon: AppIcons.strokeRoundedArrowRight02,
//                 color: AppColors.kLightSecondaryColor,
//               ),
//               onPressed: loginUser,
//             ),
//           LoggingInUserState() => PrimaryActionButton(
//               labelText: 'Logging In',
//               isIcon: true,
//               isLoading: true,
//               icon: HugeIcon(
//                 icon: AppIcons.strokeRoundedArrowRight02,
//                 color: AppColors.kLightSecondaryColor,
//               ),
//               onPressed: null,
//             ),
//           LoggedInState() => PrimaryActionButton(
//               labelText: 'Logged In',
//               isIcon: true,
//               icon: HugeIcon(
//                 icon: AppIcons.strokeRoundedArrowRight02,
//                 color: AppColors.kLightSecondaryColor,
//               ),
//               onPressed: () {},
//             ),
//           NotLoggedInUserState() => PrimaryActionButton(
//               labelText: 'Retry',
//               isIcon: true,
//               icon: HugeIcon(
//                 icon: AppIcons.strokeRoundedArrowRight02,
//                 color: AppColors.kLightSecondaryColor,
//               ),
//               onPressed: loginUser,
//             ),
//           LoginUserErrorState() => PrimaryActionButton(
//               labelText: 'Unable to login, Retry',
//               isIcon: true,
//               icon: HugeIcon(
//                 icon: AppIcons.strokeRoundedArrowRight02,
//                 color: AppColors.kLightSecondaryColor,
//               ),
//               onPressed: loginUser,
//             ),
//         };
//       },
//     );
//   }
// }

class LoginButton extends ConsumerStatefulWidget {
  final void Function()? loginUser;
  final String email;
  final String password;
  const LoginButton({
    super.key,
    required this.loginUser,
    required this.email,
    required this.password,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginButtonState();
}

class _LoginButtonState extends ConsumerState<LoginButton> {
  @override
  Widget build(BuildContext context) {
    final loginUserStateAsync = ref.watch(
      loginUserProvider(
        LoginUserParams(
          email: widget.email,
          password: widget.password,
        ),
      ),
    );
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
          LoggingInUserState() => PrimaryActionButton(
              labelText: 'Logging In',
              isIcon: true,
              isLoading: true,
              icon: HugeIcon(
                icon: AppIcons.strokeRoundedArrowRight02,
                color: AppColors.kLightSecondaryColor,
              ),
              onPressed: null,
            ),
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
