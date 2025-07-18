sealed class SubmitQuizProgressState {
  const SubmitQuizProgressState();
}

class InitialSubmitQuizProgressState extends SubmitQuizProgressState {
  const InitialSubmitQuizProgressState();
}

class  SubmittingQuizProgressState extends SubmitQuizProgressState {
  const  SubmittingQuizProgressState();
}

class  SubmittedQuizProgressState extends SubmitQuizProgressState {
  const  SubmittedQuizProgressState();
}

class NotSubmittedState extends SubmitQuizProgressState {
  const NotSubmittedState();
}

class SubmitQuizErrorState extends SubmitQuizProgressState {
  final String message;
  const SubmitQuizErrorState(this.message);
}