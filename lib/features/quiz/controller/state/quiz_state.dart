import 'package:edtech_app/data/model/quiz_model.dart';

class QuizState {
  final bool isLoading;
  final QuizModel? quizData;
  final Map<int, int> userAnswers; // questionId -> selectedOptionIndex
  final String? error;
  final int currentQuestionIndex;

  QuizState({
    this.isLoading = false,
    this.quizData,
    this.userAnswers = const {},
    this.error,
    this.currentQuestionIndex = 0,
  });

  QuizState copyWith({
    bool? isLoading,
    QuizModel? quizData,
    Map<int, int>? userAnswers,
    String? error,
    int? currentQuestionIndex,
  }) {
    return QuizState(
      isLoading: isLoading ?? this.isLoading,
      quizData: quizData ?? this.quizData,
      userAnswers: userAnswers ?? this.userAnswers,
      error: error ?? this.error,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
    );
  }
}
