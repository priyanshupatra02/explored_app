import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/features/login/const/sign_up_user_constants.dart';
import 'package:edtech_app/features/login/controller/pod/is_obscuring_text_pod.dart';
import 'package:edtech_app/features/login/controller/pod/register_user_pod.dart';
import 'package:edtech_app/features/login/view/widget/signup_button.dart';
import 'package:edtech_app/features/login/view/widget/terms_and_condition_checker_widget.dart';
import 'package:edtech_app/shared/widget/forms/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupTab extends ConsumerStatefulWidget {
  final GlobalKey<FormBuilderState> updateFormKey;
  const SignupTab({
    super.key,
    required this.updateFormKey,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupTabState();
}

class _SignupTabState extends ConsumerState<SignupTab> {
  void registerUser() {
    final name = widget.updateFormKey.currentState!.fields[SignUpUserConstants.name]!.value;
    final email =
        widget.updateFormKey.currentState!.fields[SignUpUserConstants.enterYourEmail]!.value;
    final password =
        widget.updateFormKey.currentState!.fields[SignUpUserConstants.newPassword]!.value;
    if (widget.updateFormKey.currentState!.validate()) {
      ref.read(registerUserProvider.notifier).registerUser(
            email: email,
            password: password,
            firstName: name,
            onUserRegistered: ({required userResponse}) {
              // if (userResponse.user?.firstName != null) {
              //   context.router.replaceAll([NavbarRoute()]);
              // } else {
              //   context.router.replaceAll([LoginRoute()]);
              // }
              if (userResponse.jwt != null && userResponse.user?.whatCourseDoYouNeed == null) {
                context.router.replaceAll([UpdateUserRoute()]);
              } else if (userResponse.jwt != null && userResponse.user?.feedback != null) {
                context.router.replaceAll([NavbarRoute()]);
              } else {
                context.router.replaceAll([LoginRoute()]);
              }
            },
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isObscureText = ref.watch(isObscuringTextProvider);
    return FormBuilder(
      key: widget.updateFormKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            30.heightBox,
            CustomTextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              hintText: 'Your name',
              name: SignUpUserConstants.name,
              isFillColor: true,
              fillColor: AppColors.kPrimaryWhiteColor,
              prefixIcon: HugeIcon(
                icon: AppIcons.strokeRoundedUser,
                color: AppColors.kPrimaryColor,
              ),
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(),
                ],
              ),
            ),
            CustomTextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Enter your email',
              name: SignUpUserConstants.enterYourEmail,
              isFillColor: true,
              fillColor: AppColors.kPrimaryWhiteColor,
              prefixIcon: HugeIcon(
                icon: AppIcons.strokeRoundedMail01,
                color: AppColors.kPrimaryColor,
              ),
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ],
              ),
            ),
            CustomTextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              hintText: 'New password',
              name: SignUpUserConstants.newPassword,
              isFillColor: true,
              isObscureText: isObscureText,
              maxLine: 1,
              fillColor: AppColors.kPrimaryWhiteColor,
              prefixIcon: HugeIcon(
                icon: AppIcons.strokeRoundedCircleLock02,
                color: AppColors.kPrimaryColor,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  ref.read(isObscuringTextProvider.notifier).toggle();
                },
                child: HugeIcon(
                  icon: isObscureText == true
                      ? AppIcons.strokeRoundedViewOff
                      : AppIcons.strokeRoundedView,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.password(),
                  FormBuilderValidators.minLength(6),
                ],
              ),
            ),
            50.heightBox,
            TermsAndConditionCheckerWidget(),
            30.heightBox,
            SignupButton(
              onPressed: registerUser,
            ),
          ],
        ),
      ),
    );
  }
}
