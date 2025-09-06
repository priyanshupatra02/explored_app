import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/bootstrap.dart';
import 'package:edtech_app/const/resource.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/data/services/login_db_service/login_db_service_pod.dart';
import 'package:edtech_app/features/update_user/const/update_user_constants.dart';
import 'package:edtech_app/features/update_user/controller/pod/current_step_pod.dart';
import 'package:edtech_app/features/update_user/controller/pod/icon_color_pod.dart';
import 'package:edtech_app/features/update_user/controller/pod/update_user_pod.dart';
import 'package:edtech_app/features/update_user/utils/career_suggestion_utils.dart';
import 'package:edtech_app/features/update_user/view/widgets/next_or_submit_button.dart';
import 'package:edtech_app/features/update_user/view/widgets/questions_header_widget.dart';
import 'package:edtech_app/shared/widget/forms/custom_radio_group_form_field.dart';
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
  final roleFormKey = GlobalKey<FormBuilderState>();
  final careerInterestsFormKey = GlobalKey<FormBuilderState>();
  final careerSuggestionFormKey = GlobalKey<FormBuilderState>();
  CareerSuggestion? careerSuggestion;
  MastersDegreeCareerSuggestion? mastersCareerSuggestion;

  String? _getFieldValue(Map<String, FormBuilderFieldState>? fields, String key) {
    return fields?[key]?.value as String?;
  }

  void updateUser() {
    final loginModel = ref.read(loginDbProvider).getLoginModel();
    //accessing fields
    final roleFields = roleFormKey.currentState?.fields;
    final careerInterestsFields = careerInterestsFormKey.currentState?.fields;
    final careerSuggestionFields = careerSuggestionFormKey.currentState?.fields;
    ref.read(updateUserProvider.notifier).updateUser(
          userId: loginModel!.user!.id.toString(),
          // whatCourseDoYouNeed: 'Not Selected',
          // doYouNeedCareerCounselling: 'No',
          // wouldYouLikeToBeACareerCounsellor: 'No',
          whatDoYouDo: _getFieldValue(roleFields, UpdateUserConstants.whatDoYouDo) ?? '',
          whichActivityDoYouEnjoyTheMost:
              _getFieldValue(careerInterestsFields, UpdateUserConstants.activityEnjoy) ?? '',
          whatKindOfChallengesExciteYou: _getFieldValue(
                  careerInterestsFields, UpdateUserConstants.whatKindOfChallengesExciteYou) ??
              '',
          doYouPreferWorkingWith:
              _getFieldValue(careerInterestsFields, UpdateUserConstants.doYouPreferWorkingWith) ??
                  '',
          whatDoYouEnjoyDoingInYourFreeTime: _getFieldValue(
                  careerInterestsFields, UpdateUserConstants.whatDoYouEnjoyDoingInYourFreeTime) ??
              '',
          whatComesNaturallyToYou:
              _getFieldValue(careerInterestsFields, UpdateUserConstants.whatComesNaturallyToYou) ??
                  '',
          whichSubjectWouldYouEnjoyTheMost: _getFieldValue(
                  careerInterestsFields, UpdateUserConstants.whichSubjectWouldYouEnjoyTheMost) ??
              '',
          whatKindOfWorkEnvironmentSuitsYou: _getFieldValue(
                  careerInterestsFields, UpdateUserConstants.whatKindOfWorkEnvironmentSuitsYou) ??
              '',
          howDoYouApproachProblems:
              _getFieldValue(careerInterestsFields, UpdateUserConstants.howDoYouApproachProblems) ??
                  '',
          whichSkillAreYouBestAt:
              _getFieldValue(careerInterestsFields, UpdateUserConstants.whichSkillAreYouBestAt) ??
                  '',
          whatMotivatesYouMostInACareer: _getFieldValue(
                  careerInterestsFields, UpdateUserConstants.whatMotivatesYouMostInACareer) ??
              '',
          doYouPreferWorking:
              _getFieldValue(careerInterestsFields, UpdateUserConstants.doYouPreferWorking) ?? '',
          doYouLikeJobsThatInvolve:
              _getFieldValue(careerInterestsFields, UpdateUserConstants.doYouLikeJobsThatInvolve) ??
                  '',
          howDoYouFeelAboutDeadlines: _getFieldValue(
                  careerInterestsFields, UpdateUserConstants.howDoYouFeelAboutDeadlines) ??
              '',
          wouldYouRather:
              _getFieldValue(careerInterestsFields, UpdateUserConstants.wouldYouRather) ?? '',
          whatKindOfJobStructureDoYouPrefer: _getFieldValue(
                  careerInterestsFields, UpdateUserConstants.whatKindOfJobStructureDoYouPrefer) ??
              '',
          wouldYouEnjoyACareerWhereYou: _getFieldValue(
                  careerInterestsFields, UpdateUserConstants.wouldYouEnjoyACareerWhereYou) ??
              '',
          wouldYouLikeToTravelForWork: _getFieldValue(
                  careerInterestsFields, UpdateUserConstants.wouldYouLikeToTravelForWork) ??
              '',
          whatWouldMakeYouHappiestInAJob: _getFieldValue(
                  careerInterestsFields, UpdateUserConstants.whatWouldMakeYouHappiestInAJob) ??
              '',
          doYouEnjoyWorkingWithTechnology: _getFieldValue(
                  careerInterestsFields, UpdateUserConstants.doYouEnjoyWorkingWithTechnology) ??
              '',
          areYouInterestedInHealthcareOrMedicine: _getFieldValue(careerInterestsFields,
                  UpdateUserConstants.areYouInterestedInHealthcareOrMedicine) ??
              '',
          wouldYouLikeToWorkInEducationOrTeaching: _getFieldValue(careerInterestsFields,
                  UpdateUserConstants.wouldYouLikeToWorkInEducationOrTeaching) ??
              '',
          doYouEnjoyResearchAndAnalysis: _getFieldValue(
                  careerInterestsFields, UpdateUserConstants.doYouEnjoyResearchAndAnalysis) ??
              '',
          areYouInterestedInPsychologyOrCounseling: _getFieldValue(careerInterestsFields,
                  UpdateUserConstants.areYouInterestedInPsychologyOrCounseling) ??
              '',
          wouldYouLikeACareerInMediaOrFilmOrEntertainment: _getFieldValue(careerInterestsFields,
                  UpdateUserConstants.wouldYouLikeACareerInMediaOrFilmOrEntertainment) ??
              '',
          whatIsMoreImportantToYouInAJob: _getFieldValue(
                  careerInterestsFields, UpdateUserConstants.whatIsMoreImportantToYouInAJob) ??
              '',
          wouldYouRatherDo:
              _getFieldValue(careerInterestsFields, UpdateUserConstants.wouldYouRatherDo) ?? '',
          whatKindOfEmployerDoYouPrefer: _getFieldValue(
                  careerInterestsFields, UpdateUserConstants.whatKindOfEmployerDoYouPrefer) ??
              '',
          whereWouldYouRatherWork:
              _getFieldValue(careerInterestsFields, UpdateUserConstants.whereWouldYouRatherWork) ??
                  '',
          areYouMoreOfA:
              _getFieldValue(careerInterestsFields, UpdateUserConstants.areYouMoreOfA) ?? '',
          doYouPrefer: _getFieldValue(careerInterestsFields, UpdateUserConstants.doYouPrefer) ?? '',
          careerChoice:
              _getFieldValue(careerSuggestionFields, UpdateUserConstants.careerChoice) ?? '',
          mastersCareerChoice:
              _getFieldValue(careerSuggestionFields, UpdateUserConstants.mastersCareerChoice) ?? '',
          onUserUpdated: (updatedUserResponse) {
            talker.debug(updatedUserResponse.user?.feedback);
            talker.debug("------ ${loginModel.user?.whatCourseDoYouNeed}");
            if (updatedUserResponse.user?.feedback != null) {
              context.router.replaceAll([NavbarRoute()]);
            } else {
              context.router.replaceAll([UpdateUserRoute()]);
            }
          },
        );
    // if (roleFormKey.currentState?.saveAndValidate() == true &&
    //     careerInterestsFormKey.currentState?.saveAndValidate() == true &&
    //     careerSuggestionFormKey.currentState?.saveAndValidate() == true) {
    //   // Guard against missing final selection to avoid null -> String cast crash
    //   final selectedCareer = _getFieldValue(careerSuggestionFields, UpdateUserConstants.careerChoice);
    //   if (selectedCareer == null || selectedCareer.isEmpty) {
    //     talker.error('Career choice is required but not selected.');
    //     return;
    //   }

    //   // Safely extract all field values with null checks
    //   final whatDoYouDo = _getFieldValue(roleFields, UpdateUserConstants.whatDoYouDo);
    //   if (whatDoYouDo == null) {
    //     talker.error('Role selection is required.');
    //     return;
    //   }

    //   // Access the values of the fields
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
            if (currentStep == 0 && roleFormKey.currentState!.validate()) {
              ref.read(currentStepPod.notifier).update((value) => currentStep + 1);
            }
            if (currentStep == 1 && careerInterestsFormKey.currentState!.saveAndValidate()) {
              // Generate career suggestions
              final careerInterestsFields = careerInterestsFormKey.currentState?.fields;
              if (careerInterestsFields != null) {
                final answers = {
                  'activityEnjoy':
                      _getFieldValue(careerInterestsFields, UpdateUserConstants.activityEnjoy),
                  'whatKindOfChallengesExciteYou': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.whatKindOfChallengesExciteYou),
                  'doYouPreferWorkingWith': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.doYouPreferWorkingWith),
                  'whatDoYouEnjoyDoingInYourFreeTime': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.whatDoYouEnjoyDoingInYourFreeTime),
                  'whatComesNaturallyToYou': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.whatComesNaturallyToYou),
                  'whichSubjectWouldYouEnjoyTheMost': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.whichSubjectWouldYouEnjoyTheMost),
                  'whatKindOfWorkEnvironmentSuitsYou': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.whatKindOfWorkEnvironmentSuitsYou),
                  'howDoYouApproachProblems': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.howDoYouApproachProblems),
                  'whichSkillAreYouBestAt': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.whichSkillAreYouBestAt),
                  'whatMotivatesYouMostInACareer': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.whatMotivatesYouMostInACareer),
                  'doYouPreferWorking':
                      _getFieldValue(careerInterestsFields, UpdateUserConstants.doYouPreferWorking),
                  'doYouLikeJobsThatInvolve': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.doYouLikeJobsThatInvolve),
                  'wouldYouRather':
                      _getFieldValue(careerInterestsFields, UpdateUserConstants.wouldYouRather),
                  'howDoYouFeelAboutDeadlines': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.howDoYouFeelAboutDeadlines),
                  'whatKindOfJobStructureDoYouPrefer': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.whatKindOfJobStructureDoYouPrefer),
                  'wouldYouEnjoyACareerWhereYou': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.wouldYouEnjoyACareerWhereYou),
                  'wouldYouLikeToTravelForWork': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.wouldYouLikeToTravelForWork),
                  'whatWouldMakeYouHappiestInAJob': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.whatWouldMakeYouHappiestInAJob),
                  'doYouEnjoyWorkingWithTechnology': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.doYouEnjoyWorkingWithTechnology),
                  'areYouInterestedInHealthcareOrMedicine': _getFieldValue(careerInterestsFields,
                      UpdateUserConstants.areYouInterestedInHealthcareOrMedicine),
                  'wouldYouLikeToWorkInEducationOrTeaching': _getFieldValue(careerInterestsFields,
                      UpdateUserConstants.wouldYouLikeToWorkInEducationOrTeaching),
                  'doYouEnjoyResearchAndAnalysis': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.doYouEnjoyResearchAndAnalysis),
                  'areYouInterestedInPsychologyOrCounseling': _getFieldValue(careerInterestsFields,
                      UpdateUserConstants.areYouInterestedInPsychologyOrCounseling),
                  'wouldYouLikeACareerInMediaOrFilmOrEntertainment': _getFieldValue(
                      careerInterestsFields,
                      UpdateUserConstants.wouldYouLikeACareerInMediaOrFilmOrEntertainment),
                  'whatIsMoreImportantToYouInAJob': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.whatIsMoreImportantToYouInAJob),
                  'wouldYouRatherDo':
                      _getFieldValue(careerInterestsFields, UpdateUserConstants.wouldYouRatherDo),
                  'whatKindOfEmployerDoYouPrefer': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.whatKindOfEmployerDoYouPrefer),
                  'whereWouldYouRatherWork': _getFieldValue(
                      careerInterestsFields, UpdateUserConstants.whereWouldYouRatherWork),
                  'areYouMoreOfA':
                      _getFieldValue(careerInterestsFields, UpdateUserConstants.areYouMoreOfA),
                  'doYouPrefer':
                      _getFieldValue(careerInterestsFields, UpdateUserConstants.doYouPrefer),
                };

                final filteredAnswers = <String, String>{};
                answers.forEach((key, value) {
                  if (value != null) filteredAnswers[key] = value;
                });

                careerSuggestion = CareerSuggestionUtils.getCareerSuggestion(filteredAnswers);
                mastersCareerSuggestion =
                    CareerSuggestionUtils.getMastersDegreeCareerSuggestion(filteredAnswers);
              }
              ref.read(currentStepPod.notifier).update((value) => currentStep + 1);
            }
            if (currentStep == 2 && careerSuggestionFormKey.currentState!.saveAndValidate()) {
              updateUser();
            }
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
              title: currentStep == 0 ? const Text('Role') : const SizedBox(),
              content: FormBuilder(
                key: roleFormKey,
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
                        name: UpdateUserConstants.whatDoYouDo,
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
                                  colorFilter: ColorFilter.mode(
                                    isSelectedStudentIcon
                                        ? AppColors.kSecondaryColor
                                        : AppColors.kPrimaryColor,
                                    BlendMode.srcIn,
                                  ),
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
                                  colorFilter: ColorFilter.mode(
                                    isSelectedUgIcon
                                        ? AppColors.kSecondaryColor
                                        : AppColors.kPrimaryColor,
                                    BlendMode.srcIn,
                                  ),
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
            Step(
              state: currentStep > 1 ? StepState.complete : StepState.indexed,
              isActive: currentStep >= 1,
              title: currentStep == 1 ? const Text('Career Interests') : const SizedBox(),
              content: FormBuilder(
                key: careerInterestsFormKey,
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
                      name: UpdateUserConstants.activityEnjoy,
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
                      name: UpdateUserConstants.whatKindOfChallengesExciteYou,
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
                      name: UpdateUserConstants.doYouPreferWorkingWith,
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
                            value: 'Tools & Materials', child: Text('Tools & Materials')),
                        FormBuilderFieldOption(value: 'People', child: Text('People')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 3,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.whatDoYouEnjoyDoingInYourFreeTime,
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
                      name: UpdateUserConstants.whatComesNaturallyToYou,
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
                      name: UpdateUserConstants.whichSubjectWouldYouEnjoyTheMost,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                          value: 'Mathematics',
                          child: Text('Mathematics'),
                        ),
                        FormBuilderFieldOption(
                          value: 'Languages',
                          child: Text('Languages'),
                        ),
                        FormBuilderFieldOption(
                          value: 'Sciences',
                          child: Text('Sciences'),
                        ),
                        FormBuilderFieldOption(
                          value: 'Social Sciences',
                          child: Text('Social Sciences'),
                        ),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 6,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.whatKindOfWorkEnvironmentSuitsYou,
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
                      name: UpdateUserConstants.howDoYouApproachProblems,
                      onChanged: (values) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'With logic and calculations',
                            child: Text('With logic and calculations')),
                        FormBuilderFieldOption(
                            value: 'Thinking outside the box',
                            child: Text('Thinking outside the box')),
                        FormBuilderFieldOption(
                            value: 'Hands-on solutions', child: Text('Hands-on solutions')),
                        FormBuilderFieldOption(
                            value: 'Empathy and understanding',
                            child: Text('Empathy and understanding')),
                      ],
                    ),
                    QuestionsHeaderWidget(
                      questionNumber: 8,
                    ),
                    CustomRadioGroupFormField<String>(
                      name: UpdateUserConstants.whichSkillAreYouBestAt,
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
                      name: UpdateUserConstants.whatMotivatesYouMostInACareer,
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
                      name: UpdateUserConstants.doYouPreferWorking,
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
                      name: UpdateUserConstants.doYouLikeJobsThatInvolve,
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
                      name: UpdateUserConstants.wouldYouRather,
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
                      name: UpdateUserConstants.howDoYouFeelAboutDeadlines,
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
                      name: UpdateUserConstants.whatKindOfJobStructureDoYouPrefer,
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
                      name: UpdateUserConstants.wouldYouEnjoyACareerWhereYou,
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
                      name: UpdateUserConstants.wouldYouLikeToTravelForWork,
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
                      name: UpdateUserConstants.whatWouldMakeYouHappiestInAJob,
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
                      name: UpdateUserConstants.doYouEnjoyWorkingWithTechnology,
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
                      name: UpdateUserConstants.areYouInterestedInHealthcareOrMedicine,
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
                      name: UpdateUserConstants.wouldYouLikeToWorkInEducationOrTeaching,
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
                      name: UpdateUserConstants.doYouEnjoyResearchAndAnalysis,
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
                      name: UpdateUserConstants.areYouInterestedInPsychologyOrCounseling,
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
                      name: UpdateUserConstants.wouldYouLikeACareerInMediaOrFilmOrEntertainment,
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
                      name: UpdateUserConstants.whatIsMoreImportantToYouInAJob,
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
                      name: UpdateUserConstants.wouldYouRatherDo,
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
                      name: UpdateUserConstants.whatKindOfEmployerDoYouPrefer,
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
                      name: UpdateUserConstants.whereWouldYouRatherWork,
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
                      name: UpdateUserConstants.areYouMoreOfA,
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
                      name: UpdateUserConstants.doYouPrefer,
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
                          child: Text(
                            'Creativity and flexibility',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Step(
              state: currentStep > 2 ? StepState.complete : StepState.indexed,
              isActive: currentStep >= 2,
              title: currentStep == 2 ? const Text('Career Suggestions') : const SizedBox(),
              content: careerSuggestion != null && mastersCareerSuggestion != null
                  ? FormBuilder(
                      key: careerSuggestionFormKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              careerSuggestion!.personalityType,
                              style: onboardingHeaderTextStyle,
                            ),
                            16.heightBox,
                            Text(
                              'Description',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.kPrimaryColor,
                                  ),
                            ),
                            8.heightBox,
                            Text(
                              careerSuggestion!.description,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            16.heightBox,
                            Text(
                              'Your Strengths',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green.shade700,
                                  ),
                            ),
                            8.heightBox,
                            ...careerSuggestion!.strengths.map(
                              (strength) => Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green.shade600,
                                      size: 16,
                                    ),
                                    8.widthBox,
                                    Expanded(
                                      child: Text(
                                        strength,
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            16.heightBox,
                            Text(
                              'Areas for Development',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade700,
                                  ),
                            ),
                            8.heightBox,
                            ...careerSuggestion!.weaknesses.map(
                              (weakness) => Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      color: Colors.orange.shade600,
                                      size: 16,
                                    ),
                                    8.widthBox,
                                    Expanded(
                                      child: Text(
                                        weakness,
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            24.heightBox,
                            Text(
                              'Select Your Preferred Career Path -',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade700,
                                  ),
                            ),
                            16.heightBox,
                            CustomRadioGroupFormField<String>(
                              name: UpdateUserConstants.careerChoice,
                              onChanged: (value) {
                                talker.debug('Selected career: $value');
                              },
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              options: careerSuggestion!.careerSuggestions
                                  .map(
                                    (career) => FormBuilderFieldOption(
                                      value: career,
                                      child: Text(career),
                                    ),
                                  )
                                  .toList(),
                            ),
                            32.heightBox,
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.blue.shade200),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Master\'s Degree Recommendation',
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade800,
                                        ),
                                  ),
                                  16.heightBox,
                                  Text(
                                    mastersCareerSuggestion!.personalityType,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade700,
                                        ),
                                  ),
                                  16.heightBox,
                                  Text(
                                    'Analysis',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade600,
                                        ),
                                  ),
                                  8.heightBox,
                                  Text(
                                    mastersCareerSuggestion!.analysisDescription,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  16.heightBox,
                                  Text(
                                    'Psychological Profile',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade600,
                                        ),
                                  ),
                                  8.heightBox,
                                  Text(
                                    mastersCareerSuggestion!.psychologicalDescription,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  16.heightBox,
                                  Text(
                                    'Best Programs',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade600,
                                        ),
                                  ),
                                  8.heightBox,
                                  ...mastersCareerSuggestion!.bestPrograms.map(
                                    (program) => Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.school,
                                            color: Colors.blue.shade600,
                                            size: 16,
                                          ),
                                          8.widthBox,
                                          Expanded(
                                            child: Text(
                                              program,
                                              style: Theme.of(context).textTheme.bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  16.heightBox,
                                  Text(
                                    'Industries',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade600,
                                        ),
                                  ),
                                  8.heightBox,
                                  ...mastersCareerSuggestion!.industries.map(
                                    (industry) => Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.business,
                                            color: Colors.blue.shade600,
                                            size: 16,
                                          ),
                                          8.widthBox,
                                          Expanded(
                                            child: Text(
                                              industry,
                                              style: Theme.of(context).textTheme.bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            24.heightBox,
                            Text(
                              'Select Your Preferred Master\'s Career Path -',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade700,
                                  ),
                            ),
                            16.heightBox,
                            FormBuilderRadioGroup<String>(
                              name: UpdateUserConstants.mastersCareerChoice,
                              onChanged: (value) {
                                talker.debug('Selected master\'s career: $value');
                              },
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              options: mastersCareerSuggestion!.bestPrograms
                                  .map(
                                    (program) => FormBuilderFieldOption(
                                      value: program,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          program,
                                          style: Theme.of(context).textTheme.bodyMedium,
                                          maxLines: null,
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: Text('Complete the previous steps to see your career suggestions'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
