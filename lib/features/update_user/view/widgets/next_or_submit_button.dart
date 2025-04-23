import 'package:edtech_app/const/styles/app_colors.dart';
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
    // final updateTeacherDetailsAsync = ref.watch(updateTeacherProvider);
    // return updateTeacherDetailsAsync.easyWhen(
    //   data: (updateTeacherState) {
    //     return switch (updateTeacherState) {
    //       InitialUpdateTeacherState() =>
    // ElevatedButton(
    //           onPressed: details.onStepContinue,
    //           child: Text(
    //             currentStep == 3 ? 'Submit' : 'Next',
    //           ),
    //         ),
    //       UpdatingTeacherState() => ElevatedButton(
    //           onPressed: details.onStepContinue,
    //           child: const CupertinoActivityIndicator(
    //             color: AppColors.kWhiteColor,
    //           ),
    //         ),
    //       UpdatedTeacherState() => ElevatedButton(
    //           onPressed: details.onStepContinue,
    //           child: Text('Updated'),
    //         ),
    //       NotUpdatedState() => ElevatedButton(
    //           onPressed: details.onStepContinue,
    //           child: Text(
    //             currentStep == 3 ? 'Submit' : 'Next',
    //           ),
    //         ),
    //       UpdateTeacherErrorState() => ElevatedButton(
    //           onPressed: details.onStepContinue,
    //           child: Text(
    //             currentStep == 3 ? 'Submit' : 'Next',
    //           ),
    //         ),
    //     };
    //   },
    // );
    return ElevatedButton(
      onPressed: details.onStepContinue,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: AppColors.kLightSecondaryColor,
      ),
      child: Text(
        currentStep == 5 ? 'Submit' : 'Next',
      ),
    );
  }
}
