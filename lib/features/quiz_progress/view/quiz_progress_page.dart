import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:flutter/gestures.dart';
// import 'package:edtech_app/features/quiz/controller/pod/quiz_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class QuizProgressPage extends StatelessWidget {
  final String videoId;
  const QuizProgressPage({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return QuizProgressView(
      videoId: videoId,
    );
  }
}

class QuizProgressView extends ConsumerWidget {
  final String videoId;
  const QuizProgressView({super.key, required this.videoId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final questionsAsync = ref.watch(quizQuestionsProvider);
    bool isIncorrect = false;
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
      // body: questionsAsync.when(
      //   loading: () => const Center(child: CircularProgressIndicator()),
      //   error: (error, stack) => Center(child: Text('Error: $error')),
      //   data: (questions) {
      //     return GridView.builder(
      //       padding: const EdgeInsets.all(16),
      //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 7,
      //         crossAxisSpacing: 8,
      //         mainAxisSpacing: 8,
      //       ),
      //       itemCount: questions.length,
      //       itemBuilder: (context, index) {
      //         return Container(
      //           decoration: BoxDecoration(
      //             color: Colors.blue,
      //             borderRadius: BorderRadius.circular(8),
      //           ),
      //           child: Center(
      //             child: Text(
      //               '${index + 1}',
      //               style: const TextStyle(
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
          child: Column(
            children: [
              Wrap(
                // alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: 14,
                runSpacing: 14,
                children: List.generate(
                  20,
                  (index) => Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: isIncorrect ? AppColors.kErrorColor : AppColors.kPrimaryColor,
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
                  ),
                ),
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
