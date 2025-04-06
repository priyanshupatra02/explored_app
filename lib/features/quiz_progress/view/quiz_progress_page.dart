import 'package:auto_route/auto_route.dart';
// import 'package:edtech_app/features/quiz/controller/pod/quiz_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class QuizProgressPage extends StatelessWidget {
  const QuizProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return QuizProgressView();
  }
}

class QuizProgressView extends ConsumerWidget {
  const QuizProgressView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final questionsAsync = ref.watch(quizQuestionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Progress'),
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
    );
  }
}
