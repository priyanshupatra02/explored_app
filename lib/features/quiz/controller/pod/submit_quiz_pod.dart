import 'package:edtech_app/features/quiz/controller/notifier/submit_quiz_notifier.dart';
import 'package:edtech_app/features/quiz/controller/state/submit_quiz_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final submitQuizProgressProvider =
    AsyncNotifierProvider.autoDispose<SubmitQuizAsyncNotifier, SubmitQuizProgressState>(
  SubmitQuizAsyncNotifier.new,
  name: "submitQuizProgressProvider",
);
