import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/bootstrap.dart';
import 'package:edtech_app/const/resource.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/update_user/const/update_user_constants.dart';
import 'package:edtech_app/features/update_user/controller/pod/current_step_pod.dart';
import 'package:edtech_app/features/update_user/controller/pod/icon_color_pod.dart';
import 'package:edtech_app/features/update_user/view/widgets/next_or_submit_button.dart';
import 'package:edtech_app/features/update_user/view/widgets/questions_header_widget.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:edtech_app/shared/widget/forms/custom_radio_group_form_field.dart';
import 'package:edtech_app/shared/widget/forms/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class UpdateUserPage extends StatelessWidget {
  const UpdateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UpdateUserView();
  }
}

class UpdateUserView extends ConsumerStatefulWidget {
  const UpdateUserView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => UpdateUserViewState();
}

class UpdateUserViewState extends ConsumerState<UpdateUserView> {
  final step1FormKey = GlobalKey<FormBuilderState>();
  final step2FormKey = GlobalKey<FormBuilderState>();
  final step3FormKey = GlobalKey<FormBuilderState>();
  final step4FormKey = GlobalKey<FormBuilderState>();
  final step5FormKey = GlobalKey<FormBuilderState>();
  final step6FormKey = GlobalKey<FormBuilderState>();
  void submitForm() {
    //accessing fields
    final step1Field = step1FormKey.currentState?.fields;
    final step2Field = step2FormKey.currentState?.fields;
    final step3Field = step3FormKey.currentState?.fields;
    final step4Field = step4FormKey.currentState?.fields;
    final step5Field = step5FormKey.currentState?.fields;
    final step6Field = step6FormKey.currentState?.fields;
    // if (step1FormKey.currentState?.saveAndValidate() ?? false) {
    //   // Handle form submission
    // }
  }

  @override
  Widget build(BuildContext context) {
    int currentStep = ref.watch(currentStepPod);
    final onboardingHeaderTextStyle = Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.kPrimaryColor,
        );
    return Scaffold(
      body: SafeArea(
        child: Stepper(
          controlsBuilder: (context, details) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (currentStep != 0)
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Back'),
                    ),
                  NextOrSubmitButton(
                    currentStep: currentStep,
                    details: details,
                  ),
                ],
              ),
            );
          },
          elevation: 0,
          type: StepperType.horizontal,
          currentStep: currentStep,
          onStepContinue: () async {
            ref.read(currentStepPod.notifier).update((value) => currentStep + 1);
            // if (currentStep == 0 && step1FormKey.currentState!.validate()) {
            // }
            // if (currentStep == 1 && step2FormKey.currentState!.saveAndValidate()) {
            //   ref.read(currentStepPod.notifier).update((value) => currentStep + 1);
            // }
            // if (currentStep == 2 && step3FormKey.currentState!.saveAndValidate()) {
            //   ref.read(currentStepPod.notifier).update((value) => currentStep + 1);
            // }
            // if (currentStep == 3 && step4FormKey.currentState!.validate()) {
            //   ref.read(currentStepPod.notifier).update((value) => currentStep + 1);
            // }
            // if (currentStep == 5 && step5FormKey.currentState!.validate()) {
            //   ref.read(currentStepPod.notifier).update((value) => currentStep + 1);
            // }
            // if (currentStep == 6 && step6FormKey.currentState!.validate()) {

            // }
          },
          onStepCancel: () {
            if (currentStep > 0) {
              ref.read(currentStepPod.notifier).update((state) => state -= 1);
            }
          },
          steps: [
            Step(
              state: currentStep > 0 ? StepState.complete : StepState.indexed,
              isActive: currentStep >= 0,
              title: currentStep == 0 ? const Text('Name') : const SizedBox(),
              content: FormBuilder(
                key: step1FormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2,
                  children: [
                    Text(
                      'What should we call you?'.allWordsCapitilize(),
                      style: onboardingHeaderTextStyle,
                    ),
                    20.heightBox,
                    'Full Name'.textFieldHeader(context),
                    CustomTextFormField(
                      hintText: 'e.g. arnav herlekar',
                      name: UpdateUserConstants.name,
                      fillColor: AppColors.kLightSecondaryColor,
                      isFillColor: true,
                      focusedBorderColor: Colors.transparent,
                      enableBorderColor: Colors.transparent,
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Step(
              state: currentStep > 1 ? StepState.complete : StepState.indexed,
              isActive: currentStep >= 1,
              title: currentStep == 1 ? const Text('Skill Details') : const SizedBox(),
              content: FormBuilder(
                key: step2FormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Text(
                      'What course do you need?'.allWordsCapitilize(),
                      style: onboardingHeaderTextStyle,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (p0) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(value: 'Finance', child: Text('Finance')),
                        FormBuilderFieldOption(value: 'Commerce', child: Text('Commerce')),
                        FormBuilderFieldOption(value: 'Maths', child: Text('Maths')),
                        FormBuilderFieldOption(value: 'Physics', child: Text('Physics')),
                        FormBuilderFieldOption(value: 'Chemistry', child: Text('Chemistry')),
                        FormBuilderFieldOption(value: 'English', child: Text('English')),
                      ],
                    ),
                    Text(
                      'We are adding more subjects soon....',
                      style: TextStyle(
                        color: AppColors.kGrey500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Step(
              state: currentStep > 2 ? StepState.complete : StepState.indexed,
              isActive: currentStep >= 2,
              title: currentStep == 2 ? const Text('Other Details') : const SizedBox(),
              content: FormBuilder(
                key: step3FormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      'Do you need career counselling?'.allWordsCapitilize(),
                      style: onboardingHeaderTextStyle,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.wantACareerCounselling,
                      direction: Axis.horizontal,
                      onChanged: (p0) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                          value: 'Yes',
                          child: Text('Yes'),
                        ),
                        FormBuilderFieldOption(
                          value: 'No', //TODO: change value's value to provider
                          child: Text('No'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Step(
              state: currentStep > 3 ? StepState.complete : StepState.indexed,
              isActive: currentStep >= 3,
              title: currentStep == 3 ? const Text('Career') : const SizedBox(),
              content: FormBuilder(
                key: step4FormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      'Would you like to be a career counsellor?'.allWordsCapitilize(),
                      style: onboardingHeaderTextStyle,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.wantACareerCounselling,
                      direction: Axis.horizontal,
                      onChanged: (p0) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                          value: 'Yes',
                          child: Text('Yes'),
                        ),
                        FormBuilderFieldOption(
                          value: 'No',
                          child: Text('No'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Step(
              state: currentStep > 4 ? StepState.complete : StepState.indexed,
              isActive: currentStep >= 4,
              title: currentStep == 4 ? const Text('Role') : const SizedBox(),
              content: FormBuilder(
                key: step5FormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      'What do you do?'.allWordsCapitilize(),
                      style: onboardingHeaderTextStyle,
                    ),
                    Consumer(builder: (context, ref, child) {
                      final isSelectedStudentIcon = ref.watch(iconStudentColorProvider);
                      final isSelectedUgIcon = ref.watch(iconUGColorProvider);
                      return CustomRadioGroupFormField<String>(
                        name: UpdateUserConstants.wantToBeACareerCounselling,
                        direction: Axis.horizontal,
                        borderRadius: 20,
                        onChanged: (value) {
                          if (value == "Student") {
                            ref.watch(iconUGColorProvider.notifier).update((state) => false);
                            ref.watch(iconStudentColorProvider.notifier).update((state) => true);
                          } else {
                            ref.watch(iconStudentColorProvider.notifier).update((state) => false);
                            ref.watch(iconUGColorProvider.notifier).update((state) => true);
                          }
                        },
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                          ],
                        ),
                        options: [
                          FormBuilderFieldOption(
                            value: 'Student',
                            child: Column(
                              spacing: 10,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  R.ASSETS_ICON_STUDENT_SVG,
                                  color: isSelectedStudentIcon
                                      ? AppColors.kSecondaryColor
                                      : AppColors.kPrimaryColor,
                                ),
                                Text('Student\n'),
                              ],
                            ).pSymmetric(h: 16, v: 28),
                          ),
                          FormBuilderFieldOption(
                            value: 'UG',
                            child: Column(
                              spacing: 10,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  R.ASSETS_ICON_WORKING_PROFESSIONAL_SVG,
                                  color: isSelectedUgIcon
                                      ? AppColors.kSecondaryColor
                                      : AppColors.kPrimaryColor,
                                ),
                                Text(
                                  'UG',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ).pSymmetric(h: 12, v: 24),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
            //keep it in a conditional statement
            Step(
              state: currentStep > 5 ? StepState.complete : StepState.indexed,
              isActive: currentStep >= 5,
              title: currentStep == 5 ? const Text('Career Interests') : const SizedBox(),
              content: FormBuilder(
                key: step6FormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      'Personal Strengths & Preference (10 questions)'.allWordsCapitilize(),
                      style: onboardingHeaderTextStyle,
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 0,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {
                        talker.debug(values);
                      },
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'Solving puzzles', child: Text('Solving puzzles')),
                        FormBuilderFieldOption(
                            value: 'Writing stories', child: Text('Writing stories')),
                        FormBuilderFieldOption(
                            value: 'Building things', child: Text('Building things')),
                        FormBuilderFieldOption(
                            value: 'Helping people', child: Text('Helping people')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 1,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'Logical problems', child: Text('Logical problems')),
                        FormBuilderFieldOption(
                            value: 'Expressing creativity', child: Text('Expressing creativity')),
                        FormBuilderFieldOption(
                            value: 'Fixing broken things', child: Text('Fixing broken things')),
                        FormBuilderFieldOption(
                            value: 'Supporting others', child: Text('Supporting others')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 2,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(value: 'Numbers', child: Text('Numbers')),
                        FormBuilderFieldOption(value: 'Words', child: Text('Words')),
                        FormBuilderFieldOption(
                            value: 'Tools and materials', child: Text('Tools and materials')),
                        FormBuilderFieldOption(value: 'People', child: Text('People')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 3,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'Playing strategy games', child: Text('Playing strategy games')),
                        FormBuilderFieldOption(
                            value: 'Reading or writing', child: Text('Reading or writing')),
                        FormBuilderFieldOption(value: 'DIY projects', child: Text('DIY projects')),
                        FormBuilderFieldOption(
                            value: 'Guiding others', child: Text('Guiding others')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 4,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'Finding patterns', child: Text('Finding patterns')),
                        FormBuilderFieldOption(value: 'Storytelling', child: Text('Storytelling')),
                        FormBuilderFieldOption(
                            value: 'Designing or fixing', child: Text('Designing or fixing')),
                        FormBuilderFieldOption(
                            value: 'Motivating others', child: Text('Motivating others')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 5,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(value: 'Mathematics', child: Text('Mathematics')),
                        FormBuilderFieldOption(value: 'Languages', child: Text('Languages')),
                        FormBuilderFieldOption(value: 'Sciences', child: Text('Sciences')),
                        FormBuilderFieldOption(
                            value: 'Social Sciences', child: Text('Social Sciences')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 6,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'A quiet office', child: Text('A quiet office')),
                        FormBuilderFieldOption(
                            value: 'A creative space', child: Text('A creative space')),
                        FormBuilderFieldOption(
                            value: 'A lab or workshop', child: Text('A lab or workshop')),
                        FormBuilderFieldOption(
                            value: 'A community/outdoor setting',
                            child: Text('A community/outdoor setting')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 7,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'Finance', child: Text('With logic and calculations')),
                        FormBuilderFieldOption(
                            value: 'Commerce', child: Text('Thinking outside the box')),
                        FormBuilderFieldOption(value: 'Maths', child: Text('Hands-on solutions')),
                        FormBuilderFieldOption(
                            value: 'Physics', child: Text('Empathy and understanding')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 8,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'Analysing and calculating',
                            child: Text('Analysing and calculating')),
                        FormBuilderFieldOption(
                            value: 'Writing or designing', child: Text('Writing or designing')),
                        FormBuilderFieldOption(
                            value: 'Building or fixing', child: Text('Building or fixing')),
                        FormBuilderFieldOption(
                            value: 'Communicationg and leading',
                            child: Text('Communicationg and leading')),
                      ],
                    ),

                    QuestionsHeaderWidget(
                      questionNumber: 9,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'Critical thinking', child: Text('Critical thinking')),
                        FormBuilderFieldOption(
                            value: 'Creative expression', child: Text('Creative expression')),
                        FormBuilderFieldOption(
                            value: 'Practical skills', child: Text('Practical skills')),
                        FormBuilderFieldOption(
                            value: 'Making a difference', child: Text('Making a difference')),
                      ],
                    ),
                    Text(
                      'Work style & Preference (8 questions)'.allWordsCapitilize(),
                      style: onboardingHeaderTextStyle,
                    ),
                    20.heightBox, // Add some spacing
                    QuestionsHeaderWidget(
                      questionNumber: 10,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(value: 'Alone', child: Text('Alone')),
                        FormBuilderFieldOption(
                            value: 'In a team to brainstorm',
                            child: Text('In a team to brainstorm')),
                        FormBuilderFieldOption(
                            value: 'Alone or in a team based on task',
                            child: Text('Alone or in a team based on task')),
                        FormBuilderFieldOption(
                            value: 'In a team where you can lead',
                            child: Text('In a team where you can lead')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 11,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'Problem-solving', child: Text('Problem-solving')),
                        FormBuilderFieldOption(value: 'Creativity', child: Text('Creativity')),
                        FormBuilderFieldOption(
                            value: 'Hands-on tasks', child: Text('Hands-on tasks')),
                        FormBuilderFieldOption(
                            value: 'Managing/helping people',
                            child: Text('Managing/helping people')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 12,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(value: 'Analyze data', child: Text('Analyze data')),
                        FormBuilderFieldOption(
                            value: 'Write or design', child: Text('Write or design')),
                        FormBuilderFieldOption(
                            value: 'Invent or fix things', child: Text('Invent or fix things')),
                        FormBuilderFieldOption(
                            value: 'Understand and help people',
                            child: Text('Understand and help people')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 13,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'I thrive under them', child: Text('I thrive under them')),
                        FormBuilderFieldOption(
                            value: 'I prefer flexibility', child: Text('I prefer flexibility')),
                        FormBuilderFieldOption(
                            value: 'I like structured timelines',
                            child: Text('I like structured timelines')),
                        FormBuilderFieldOption(
                            value: 'I focus more on people than time',
                            child: Text('I focus more on people than time')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 14,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(value: 'Well-defined', child: Text('Well-defined')),
                        FormBuilderFieldOption(
                            value: 'Creative and flexible', child: Text('Creative and flexible')),
                        FormBuilderFieldOption(
                            value: 'Technical and active', child: Text('Technical and active')),
                        FormBuilderFieldOption(
                            value: 'People-centered with variety',
                            child: Text('People-centered with variety')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 15,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'Solve problems', child: Text('Solve problems')),
                        FormBuilderFieldOption(
                            value: 'Create something new', child: Text('Create something new')),
                        FormBuilderFieldOption(
                            value: 'Work with machines', child: Text('Work with machines')),
                        FormBuilderFieldOption(
                            value: 'Support and guide others',
                            child: Text('Support and guide others')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 16,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(value: 'No', child: Text('No')),
                        FormBuilderFieldOption(
                            value: 'Yes, for cultural/artistic reasons',
                            child: Text('Yes, for cultural/artistic reasons')),
                        FormBuilderFieldOption(
                            value: 'Yes, for technical projects',
                            child: Text('Yes, for technical projects')),
                        FormBuilderFieldOption(
                            value: 'Yes, to serve communities',
                            child: Text('Yes, to serve communities')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 17,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'Intellectual challenges',
                            child: Text('Intellectual challenges')),
                        FormBuilderFieldOption(
                            value: 'Creative freedom', child: Text('Creative freedom')),
                        FormBuilderFieldOption(
                            value: 'Technical tasks', child: Text('Technical tasks')),
                      ],
                    ),
                    Text(
                      'Career Field Interests (6 questions)'.allWordsCapitilize(),
                      style: onboardingHeaderTextStyle,
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 18,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.wantACareerCounselling,
                      direction: Axis.horizontal,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                          value: 'Yes',
                          child: Text('Yes'),
                        ),
                        FormBuilderFieldOption(
                          value: 'No',
                          child: Text('No'),
                        ),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 19,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.wantACareerCounselling,
                      direction: Axis.horizontal,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                          value: 'Yes',
                          child: Text('Yes'),
                        ),
                        FormBuilderFieldOption(
                          value: 'No',
                          child: Text('No'),
                        ),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 20,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.wantACareerCounselling,
                      direction: Axis.horizontal,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                          value: 'Yes',
                          child: Text('Yes'),
                        ),
                        FormBuilderFieldOption(
                          value: 'No',
                          child: Text('No'),
                        ),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 21,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.wantACareerCounselling,
                      direction: Axis.horizontal,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                          value: 'Yes',
                          child: Text('Yes'),
                        ),
                        FormBuilderFieldOption(
                          value: 'No',
                          child: Text('No'),
                        ),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 22,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.wantACareerCounselling,
                      direction: Axis.horizontal,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                          value: 'Yes',
                          child: Text('Yes'),
                        ),
                        FormBuilderFieldOption(
                          value: 'No',
                          child: Text('No'),
                        ),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 23,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.wantACareerCounselling,
                      direction: Axis.horizontal,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                          value: 'Yes',
                          child: Text('Yes'),
                        ),
                        FormBuilderFieldOption(
                          value: 'No',
                          child: Text('No'),
                        ),
                      ],
                    ),
                    Text(
                      'Future Career Goals (4 questions)'.allWordsCapitilize(),
                      style: onboardingHeaderTextStyle,
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 24,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(value: 'High salary', child: Text('High salary')),
                        FormBuilderFieldOption(value: 'Satisfaction', child: Text('Satisfaction')),
                        FormBuilderFieldOption(value: 'Security', child: Text('Security')),
                        FormBuilderFieldOption(value: 'Growth', child: Text('Growth')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 25,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'Solve logical problems', child: Text('Solve logical problems')),
                        FormBuilderFieldOption(value: 'Create/write', child: Text('Create/write')),
                        FormBuilderFieldOption(value: 'Build/repair', child: Text('Build/repair')),
                        FormBuilderFieldOption(
                            value: 'Counsel/support others', child: Text('Counsel/support others')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 26,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(value: 'Big company', child: Text('Big company')),
                        FormBuilderFieldOption(
                            value: 'Your own business', child: Text('Your own business')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 27,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (p0) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(value: 'Indoors', child: Text('Indoors')),
                        FormBuilderFieldOption(value: 'Outdoors', child: Text('Outdoors')),
                      ],
                    ),
                    Text(
                      'Personality-Based Career Fit (2 Questions)'.allWordsCapitilize(),
                      style: onboardingHeaderTextStyle,
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 28,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (p0) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(value: 'Leader', child: Text('Leader')),
                        FormBuilderFieldOption(value: 'Team player', child: Text('Team player')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 29,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.course,
                      onChanged: (p0) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'Precision and routine', child: Text('Precision and routine')),
                        FormBuilderFieldOption(
                            value: 'Creativity and flexibility',
                            child: Text('Creativity and flexibility')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
