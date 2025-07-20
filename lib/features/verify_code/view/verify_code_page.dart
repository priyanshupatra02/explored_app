import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/resource.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/features/verify_code/view/widget/otp_form.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:edtech_app/shared/helper/global_helper.dart';
import 'package:edtech_app/shared/widget/buttons/primary_action_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return VerifyCodeView();
  }
}

class VerifyCodeView extends ConsumerStatefulWidget {
  const VerifyCodeView({super.key});

  @override
  ConsumerState<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends ConsumerState<VerifyCodeView> with GlobalHelper {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            20.heightBox,
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                R.ASSETS_APP_ICON_EXPLORED_LOGO_JPEG,
                height: 70,
              ),
            ),
            40.heightBox,
            Text(
              'Enter verification code',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            15.heightBox,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'We have sent a code to ',
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'patra.priyanshu02@gmail.com'.hardCoded,
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ).px64(),
            50.heightBox,
            OtpForm(otpController: _otpController),
            60.heightBox,
            20.heightBox,
          ],
        ).p16(),
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryActionButton(
              labelText: 'Verify Now',
              onPressed: () {
                context.navigateTo(BlogsRoute());
              },
            ),
            10.heightBox,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Didn\'t receive the code? ',
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'Resend code',
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ).px64(),
          ],
        ).p16(),
      ),
    );
  }
}
