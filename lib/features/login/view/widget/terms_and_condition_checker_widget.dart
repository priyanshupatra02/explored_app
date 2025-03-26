import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/login/controller/pod/is_agreed_to_terms_pod.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TermsAndConditionCheckerWidget extends StatelessWidget {
  const TermsAndConditionCheckerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final isAgree = ref.watch(isAgreedToTermsAndConditionsProvider);
        return CheckboxListTile.adaptive(
          value: isAgree,
          activeColor: AppColors.kPrimaryColor,
          onChanged: (val) {
            ref.read(isAgreedToTermsAndConditionsProvider.notifier).toggle();
          },
          title: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text: 'By signing in, you agree to our ',
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: 'Terms of service',
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                TextSpan(
                  text: ' and ',
                ),
                TextSpan(
                  text: 'Privacy policy.',
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
