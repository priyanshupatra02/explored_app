import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class QuizQuestionPage extends StatelessWidget {
  final int questionId;
  const QuizQuestionPage({super.key, required this.questionId});

  @override
  Widget build(BuildContext context) {
    // return QuizQuestionView(
    //   questionId: questionId,
    // );
    return Container();
  }
}

// class QuizQuestionView extends ConsumerWidget {
//   final int questionId;

//   const QuizQuestionView({
//     required this.questionId,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final quizState = ref.watch(quizControllerProvider);
//     final quizController = ref.read(quizControllerProvider.notifier);

//     // Ensure the current question index matches the questionId parameter
//     if (quizState.currentQuestionIndex != questionId && !quizState.isLoading) {
//       // Update the controller's state to match our route parameter
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         ref.read(quizControllerProvider.notifier).state =
//             quizState.copyWith(currentQuestionIndex: questionId);
//       });
//     }

//     if (quizState.isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     if (quizState.error != null) {
//       return Center(child: Text('Error: ${quizState.error}'));
//     }

//     if (quizState.quizData == null || quizState.quizData!.data.isEmpty) {
//       return const Center(child: Text('No quiz data available'));
//     }

//     final totalQuestions = quizState.quizData!.data.length;
//     if (questionId >= totalQuestions) {
//       return const Center(child: Text('Question not found'));
//     }

//     final question = quizState.quizData!.data[questionId];
//     final selectedOptionIndex = quizState.userAnswers[questionId];

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             context.router.pop();
//           },
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Take'),
//             Text('Quiz ($totalQuestions questions)'),
//           ],
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Question ${questionId + 1}',
//                 style: const TextStyle(fontSize: 16, color: Colors.blue),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 question.question,
//                 style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 24),
//               ...List.generate(
//                 question.options.length,
//                 (index) => Padding(
//                   padding: const EdgeInsets.only(bottom: 12.0),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       quizController.answerQuestion(questionId, index);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: selectedOptionIndex == index ? Colors.blue : Colors.white,
//                       foregroundColor: selectedOptionIndex == index ? Colors.white : Colors.blue,
//                       minimumSize: const Size(double.infinity, 48),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         side: BorderSide(color: Colors.blue.shade200),
//                       ),
//                     ),
//                     child: Text(question.options[index]),
//                   ),
//                 ),
//               ),
//               if (selectedOptionIndex != null) ...[
//                 const SizedBox(height: 24),
//                 GestureDetector(
//                   onTap: () {
//                     // Toggle explanation visibility logic here if needed
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: const [
//                       Text(
//                         'See Explanation',
//                         style: TextStyle(color: Colors.blue),
//                       ),
//                       Icon(Icons.keyboard_arrow_down, color: Colors.blue),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.blue.withOpacity(0.05),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Basic Explanation:',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(question.explaination),
//                     ],
//                   ),
//                 ),
//               ],
//               const Spacer(),
//               Row(
//                 children: [
//                   Expanded(
//                     child: OutlinedButton(
//                       onPressed: () {
//                         // Check answer logic
//                       },
//                       style: OutlinedButton.styleFrom(
//                         minimumSize: const Size(double.infinity, 48),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(24),
//                         ),
//                       ),
//                       child: const Text('Check'),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: selectedOptionIndex != null
//                           ? () {
//                               quizController.navigateToNextQuestion();
//                             }
//                           : null,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         minimumSize: const Size(double.infinity, 48),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(24),
//                         ),
//                       ),
//                       child: Text(
//                         quizController.isLastQuestion() ? 'Submit' : 'Save & Next',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
