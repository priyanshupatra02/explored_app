import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/features/login/const/update_constants.dart';
import 'package:edtech_app/features/login/controller/pod/is_obscuring_text_pod.dart';
import 'package:edtech_app/features/login/view/widget/terms_and_condition_checker_widget.dart';
import 'package:edtech_app/shared/widget/buttons/primary_action_button.dart';
import 'package:edtech_app/shared/widget/forms/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupTab extends ConsumerWidget {
  const SignupTab({
    super.key,
    required this.updateFormKey,
  });

  final GlobalKey<FormBuilderState> updateFormKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscureText = ref.watch(isObscuringTextProvider);
    return FormBuilder(
      key: updateFormKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            30.heightBox,
            CustomTextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              hintText: 'Your name',
              name: UpdateConstants.name,
              isFillColor: true,
              fillColor: AppColors.kPrimaryWhiteColor,
              prefixIcon: HugeIcon(
                icon: AppIcons.strokeRoundedUser,
                color: AppColors.kPrimaryColor,
              ),
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.firstName(),
                ],
              ),
            ),
            CustomTextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Enter your email',
              name: UpdateConstants.enterYourEmail,
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
              name: UpdateConstants.confirmPassword,
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
                ],
              ),
            ),
            CustomTextFormField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              hintText: 'Confirm password',
              name: UpdateConstants.confirmPassword,
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
                  //match with the new password field
                  FormBuilderValidators.equal(UpdateConstants.newPassword),
                ],
              ),
            ),
            50.heightBox,
            TermsAndConditionCheckerWidget(),
            30.heightBox,
            PrimaryActionButton(
              labelText: 'Signup',
              isIcon: true,
              icon: HugeIcon(
                icon: AppIcons.strokeRoundedArrowRight02,
                color: AppColors.kLightSecondaryColor,
              ),
              onPressed: () {
                context.navigateTo(VerifyCodeRoute());
                if (updateFormKey.currentState!.validate()) {}
              },
            ),
          ],
        ),
      ),
    );
  }
}
