import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/update_user/controller/pod/update_user_pod.dart';
import 'package:edtech_app/features/update_user/controller/state/update_user_state.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NextOrSubmitButton extends ConsumerWidget {
  const NextOrSubmitButton({
    super.key,
    required this.currentStep,
    required this.details,
  });

  final int currentStep;
  final ControlsDetails details;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateUserAsync = ref.watch(updateUserProvider);
    return updateUserAsync.easyWhen(
      data: (updateUserState) {
        return switch (updateUserState) {
          InitialUpdateUserState() => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                foregroundColor: AppColors.kLightSecondaryColor,
              ),
              onPressed: details.onStepContinue,
              child: Text(
                currentStep == 2 ? 'Submit' : 'Next',
              ),
            ),
          UpdatingUserState() => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                foregroundColor: AppColors.kLightSecondaryColor,
              ),
              onPressed: null,
              child: CupertinoActivityIndicator(
                color: AppColors.kPrimaryWhiteColor,
              ),
            ),
          UpdatedUserState() => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: AppColors.kLightSecondaryColor,
              ),
              onPressed: null,
              child: Text('Updated'),
            ),
          NotUpdatedUserState() => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                foregroundColor: AppColors.kLightSecondaryColor,
              ),
              onPressed: details.onStepContinue,
              child: Text(
                currentStep == 2 ? 'Submit' : 'Next',
              ),
            ),
          UpdateUserErrorState() => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                foregroundColor: AppColors.kLightSecondaryColor,
              ),
              onPressed: details.onStepContinue,
              child: Text(
                currentStep == 2 ? 'Submit' : 'Next',
              ),
            ),
        };
      },
    );
  }
}
