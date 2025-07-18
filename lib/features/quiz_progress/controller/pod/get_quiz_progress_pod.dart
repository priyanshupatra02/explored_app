import 'package:edtech_app/data/model/get_quiz_progress_model.dart';
import 'package:edtech_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizProgressProvider = FutureProvider.autoDispose.family<GetQuizProgressModel, String>(
  (ref, videoId) async {
    final result = await ref.watch(apiHelperProvider).getQuizProgressByVideoId(videoId: videoId);
    return result.when(
      (quizProgresResponse) {
        return quizProgresResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "quizProgressProvider",
);
