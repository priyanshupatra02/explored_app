

// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class QuizController extends StateNotifier<QuizState> {
//   final QuizRepository _quizRepository;
//   final AutoRouter _router;

//   QuizController(this._quizRepository, this._router) : super(QuizState());

//   Future<void> fetchQuizData() async {
//     state = state.copyWith(isLoading: true, error: null);
//     final result = await _quizRepository.fetchQuiz();
    
//     result.when(
//       (quizData) {
//         state = state.copyWith(
//           quizData: quizData,
//           isLoading: false,
//           currentQuestionIndex: 0,
//         );
        
//         // Navigate to the first question if quiz has questions
//         if (quizData.data.isNotEmpty) {
//           _router.navigate(QuizQuestionRoute(questionId: 0));
//         }
//       },
//       (exception) {
//         state = state.copyWith(
//           error: exception.toString(),
//           isLoading: false,
//         );
//       },
//     );
//   }

//   void answerQuestion(int questionIndex, int selectedOptionIndex) {
//     final updatedAnswers = Map<int, int>.from(state.userAnswers);
//     updatedAnswers[questionIndex] = selectedOptionIndex;
    
//     state = state.copyWith(userAnswers: updatedAnswers);
//   }

//   void navigateToNextQuestion() {
//     final quizData = state.quizData;
//     if (quizData == null) return;
    
//     final nextIndex = state.currentQuestionIndex + 1;
    
//     if (nextIndex < quizData.data.length) {
//       state = state.copyWith(currentQuestionIndex: nextIndex);
//       _router.navigate(QuizQuestionRoute(questionId: nextIndex));
//     } else {
//       // We've reached the end of the quiz, navigate to progress page
//       _router.navigate(const QuizProgressRoute());
//     }
//   }

//   bool isLastQuestion() {
//     final quizData = state.quizData;
//     if (quizData == null) return true;
    
//     return state.currentQuestionIndex >= quizData.data.length - 1;
//   }

//   int getTotalQuestions() {
//     return state.quizData?.data.length ?? 0;
//   }
// }
