import 'package:edtech_app/features/quiz/controller/notifier/update_quiz_notifier.dart';
import 'package:edtech_app/features/quiz/controller/state/submit_quiz_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateQuizProgressProvider =
    AsyncNotifierProvider.autoDispose<UpdateQuizAsyncNotifier, SubmitQuizProgressState>(
  UpdateQuizAsyncNotifier.new,
  name: "updateQuizProgressProvider",
);
