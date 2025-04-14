import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/update_user/const/update_user_constants.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:edtech_app/shared/widget/forms/custom_text_formfield.dart';
import 'package:fine_stepper/fine_stepper.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class UpdateUserPage extends StatelessWidget {
  const UpdateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UpdateUserView();
  }
}

class UpdateUserView extends StatelessWidget {
  const UpdateUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FineStepper.linear(
          indicatorOptions: IndicatorOptions(
            activeStepColor: AppColors.kPrimaryColor.withValues(alpha: 0.5),
            completedStepColor: AppColors.kPrimaryColor,
          ),
          steps: [
            StepItem.linear(
              title: '1 of 6',
              builder: (context) => StepBuilder(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // spacing: 10,
                  children: [
                    30.heightBox,
                    Text(
                      'What Should We Call You?',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.kPrimaryColor,
                          ),
                    ),
                    20.heightBox,
                    'Full Name'.textFieldHeader(context),
                    CustomTextFormField(
                      hintText: 'e.g. arnav',
                      fillColor: AppColors.kLightSecondaryColor,
                      isFillColor: true,
                      enableBorderColor: Colors.transparent,
                      focusedBorderColor: Colors.transparent,
                      name: UpdateUserConstants.name,
                    ),
                  ],
                ).px16(),
              ),
            ),
            StepItem.linear(
              title: '',
              builder: (context) => StepBuilder(
                child: Text('Step ${FineStepper.of(context).stepIndex}'),
              ),
            ),
            StepItem.linear(
              title: '',
              builder: (context) => StepBuilder(
                child: Text('Step ${FineStepper.of(context).stepIndex}'),
              ),
            ),
            StepItem.linear(
              title: '',
              builder: (context) => StepBuilder(
                child: Text('Step ${FineStepper.of(context).stepIndex}'),
              ),
            ),
            StepItem.linear(
              title: '',
              builder: (context) => StepBuilder(
                child: Text('Step ${FineStepper.of(context).stepIndex}'),
              ),
            ),
            StepItem.linear(
              title: '',
              builder: (context) => StepBuilder(
                child: Text('Step ${FineStepper.of(context).stepIndex}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
