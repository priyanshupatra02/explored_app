import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/login/const/login_constants.dart';
import 'package:edtech_app/features/login/controller/pod/is_obscuring_text_pod.dart';
import 'package:edtech_app/shared/widget/buttons/primary_action_button.dart';
import 'package:edtech_app/shared/widget/forms/custom_text_formfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginTab extends ConsumerWidget {
  const LoginTab({
    super.key,
    required this.loginFormKey,
  });

  final GlobalKey<FormBuilderState> loginFormKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscureText = ref.watch(isObscuringTextProvider);
    return FormBuilder(
      key: loginFormKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            30.heightBox,
            CustomTextFormField(
              hintText: 'arnav@ExploreEd.com',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              name: LoginConstants.email,
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
            10.heightBox,
            CustomTextFormField(
              hintText: 'qwert123',
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              name: LoginConstants.password,
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
            GestureDetector(
              onTap: () {},
              child: Text('Forgot Password ?').objectCenterRight(),
            ),
            50.heightBox,
            PrimaryActionButton(
              labelText: 'Login',
              isIcon: true,
              icon: HugeIcon(
                icon: AppIcons.strokeRoundedArrowRight02,
                color: AppColors.kLightSecondaryColor,
              ),
              onPressed: () {
                if (loginFormKey.currentState!.validate()) {}
              },
            ),
            30.heightBox,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'By signing in, you agree to our ',
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'Terms of service',
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                  ),
                  TextSpan(
                    text: 'Privacy policy.',
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ).px64(),
          ],
        ),
      ),
    );
  }
}
