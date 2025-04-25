import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/quiz/view/widget/see_explanation_tile.dart';
import 'package:edtech_app/features/update_user/const/update_user_constants.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:edtech_app/shared/widget/buttons/back_button_widget.dart';
import 'package:edtech_app/shared/widget/forms/custom_radio_group_form_field.dart';
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

class _QuizViewState extends ConsumerState<QuizView> {
  late final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                if (pageController.page!.toInt() == 0) {
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
                if (pageController.page!.toInt() == 9) {
                  context.router.pop();
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                foregroundColor: AppColors.kLightSecondaryColor,
              ),
              child: Text('Next'),
            )
          ],
        ).pSymmetric(h: 14, v: 30),
      ),
      body: SafeArea(
        child: PageView.builder(
          itemCount: 10,
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.kBlue100.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 12,
                      children: [
                        Text(
                          'Question ${index + 1}',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: AppColors.kPrimaryColor,
                              ),
                        ),
                        Text(
                          'What is the time complexity of binary search on a sorted array?',
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                color: AppColors.kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                              ),
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
                            FormBuilderFieldOption(value: 'Finance', child: Text('O(n)')),
                            FormBuilderFieldOption(value: 'Commerce', child: Text('O(1)')),
                            FormBuilderFieldOption(value: 'Maths', child: Text('O(n log n)')),
                          ],
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
                        'Paris is the capital and most populous city of France. It is located on the Seine River, in the north of the country, at the heart of the Île-de-France region.',
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.kPrimaryColor,
                            ),
                      ).px12(),
                    ),
                  ).pOnly(right: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
