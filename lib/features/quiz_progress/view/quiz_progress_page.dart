import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/features/quiz_progress/controller/pod/get_quiz_progress_pod.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class QuizProgressPage extends StatelessWidget {
  final String videoDocumentId;
  const QuizProgressPage({super.key, required this.videoDocumentId});

  @override
  Widget build(BuildContext context) {
    return QuizProgressView(
      videoId: videoDocumentId,
    );
  }
}

class QuizProgressView extends ConsumerWidget {
  final String videoId;
  const QuizProgressView({super.key, required this.videoId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final questionsAsync = ref.watch(quizQuestionsProvider);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            context.router.replaceAll([NavbarRoute()]);
          },
          child: HugeIcon(
            icon: AppIcons.strokeRoundedArrowLeft01,
            color: AppColors.kPrimaryColor,
          ),
        ),
        title: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(
                text: 'Quiz \n',
                recognizer: TapGestureRecognizer()..onTap = () {},
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              TextSpan(
                text: 'Progress'.hardCoded,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
          child: Column(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final quizProgressAsync = ref.watch(quizProgressProvider(videoId));
                  return quizProgressAsync.easyWhen(
                    data: (quizProgressModel) {
                      if (quizProgressModel.quizProgressData == null ||
                          quizProgressModel.quizProgressData!.isEmpty) {
                        return Center(
                          child: Text(
                            'No quiz progress available',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Colors.grey[600],
                                ),
                          ),
                        );
                      }

                      final quizProgress =
                          quizProgressModel.quizProgressData!.first.quizProgress ?? [];

                      return Wrap(
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        spacing: 14,
                        runSpacing: 14,
                        children: List.generate(
                          quizProgress.length,
                          (index) {
                            // Get the quiz result for this index
                            final quizMap = quizProgress[index];
                            final indexKey = index.toString();
                            final isCorrect = quizMap[indexKey] ?? false;

                            return Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: isCorrect
                                    ? AppColors.kPrimaryColor
                                    : AppColors.kErrorColor.withValues(alpha: 0.8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    color: AppColors.kPrimaryWhiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              Divider(
                color: AppColors.kGrey500,
                height: 100,
                thickness: 0.5,
              ).px16(),
            ],
          ),
        ).objectTopCenter(),
      ),
    );
  }
}
