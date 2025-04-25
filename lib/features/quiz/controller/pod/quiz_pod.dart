import 'package:edtech_app/data/model/quiz_model.dart';
import 'package:edtech_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizProvider = FutureProvider.autoDispose.family<QuizModel, String>(
  (ref, videoId) async {
    final result = await ref.watch(apiHelperProvider).getQuizByVideoId(videoId: videoId);
    ref.keepAlive();
    return result.when(
      (quizModel) {
        return quizModel;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "quizProvider",
);
