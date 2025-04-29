import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/features/quiz/const/quiz_constants.dart';
import 'package:edtech_app/features/quiz/controller/pod/quiz_pod.dart';
import 'package:edtech_app/features/quiz/view/widget/see_explanation_tile.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:edtech_app/shared/helper/global_helper.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:edtech_app/shared/widget/buttons/back_button_widget.dart';
import 'package:edtech_app/shared/widget/forms/custom_radio_group_form_field.dart';
import 'package:flash/flash.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class QuizPage extends StatelessWidget {
  final String questionId;
  const QuizPage({super.key, required this.questionId});

  @override
  Widget build(BuildContext context) {
    return QuizView(
      questionId: questionId,
    );
  }
}

class QuizView extends ConsumerStatefulWidget {
  final String questionId;
  const QuizView({
    super.key,
    required this.questionId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizViewState();
}

class _QuizViewState extends ConsumerState<QuizView> with GlobalHelper {
  late final pageController = PageController();
  final quizFormKey = GlobalKey<FormBuilderState>();
  int currentPageIndex = 0; // Track the current page index

  @override
  void initState() {
    super.initState();
    // Add a listener to update the current page index when page changes
    pageController.addListener(() {
      if (pageController.page != null && pageController.page!.round() != currentPageIndex) {
        setState(() {
          currentPageIndex = pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quizAsync = ref.watch(quizProvider(widget.questionId));

    return quizAsync.easyWhen(
      data: (quizModel) {
        final quizLength = quizModel.quizDataList.length;
        final isLastQuestion = currentPageIndex == quizLength - 1;


        return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            leading: BackButtonWidget(),
            title: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'Take \n',
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                  TextSpan(
                    text: 'Quiz (30 questions)'.hardCoded,
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    if (currentPageIndex == 0) {
                      context.router.pop();
                    } else {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    }
                  },
                  child: Text('Back'),
                ),
                10.widthBox,
                ElevatedButton(
                  onPressed: () {
                    // if last question then submit and go back to the quiz page
                    if (isLastQuestion) {
                      // Submit logic here
                      context.navigateTo(QuizProgressRoute(videoId: 'videoId'));
                    } else {
                      // If not last question then move forward to the next question
                      if (quizFormKey.currentState?.validate() == true) {
                        quizFormKey.currentState?.save();
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        showErrorSnack(
                          position: FlashPosition.top,
                          child: Text(
                            'Please answer the question to proceed.',
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kPrimaryColor,
                    foregroundColor: AppColors.kLightSecondaryColor,
                  ),
                  child: isLastQuestion ? Text('Submit') : Text('Next'),
                )
              ],
            ).pSymmetric(h: 14, v: 30),
          ),
          body: SafeArea(
            child: FormBuilder(
              key: quizFormKey,
              child: PageView.builder(
                itemCount: quizLength,
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  // Update the page index when page changes
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final quizIndex = quizModel.quizDataList[index];
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.kBlue100.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            spacing: 12,
                            children: [
                              Text(
                                'Question ${index + 1}', //starts with "question 1"
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColors.kPrimaryColor,
                                    ),
                              ),
                              Text(
                                quizIndex.question,
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: AppColors.kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                                    ),
                              ),
                              CustomRadioGroupFormField<int>(
                                name: "${QuizConstants.quiz}${index + 1}", //starts with "quiz1"
                                onChanged: (value) {
                                  if (value == quizIndex.correctAnswerIndex) {
                                    //update the name of the field
                                  } else {
                                    // Handle incorrect answer
                                  }
                                },
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(),
                                  ],
                                ),
                                options: quizIndex.quizOptions
                                    .map(
                                      (quizOption) => FormBuilderFieldOption(
                                        value: quizIndex.quizOptions.indexOf(quizOption),
                                        child: Text(
                                          quizOption.name,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                        20.heightBox,
                        SeeExplanationTile(
                          title: 'See Explanation',
                          content: SizedBox(
                            width: double.infinity,
                            child: Text(
                              quizIndex.explanation,
                              textAlign: TextAlign.justify,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.kPrimaryColor,
                                  ),
                            ).pOnly(left: 46),
                          ),
                        ).pOnly(right: 46),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
