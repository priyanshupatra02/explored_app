import 'dart:async';

import 'package:edtech_app/data/model/submit_quiz_response_model.dart';
import 'package:edtech_app/data/network/api_helper_pod.dart';
import 'package:edtech_app/features/quiz/controller/state/submit_quiz_state.dart';
import 'package:edtech_app/shared/exception/base_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubmitQuizAsyncNotifier extends AutoDisposeAsyncNotifier<SubmitQuizProgressState> {
  @override
  FutureOr<SubmitQuizProgressState> build() {
    return const InitialSubmitQuizProgressState();
  }

  Future<void> submitQuizProgress({
    required List<Map<String, bool>> quizProgress,
    required int videoId,
    required void Function(SubmitQuizResponseModel submitQuizResponseModel) onQuizSubmitted,
    required void Function(APIException errorMessage) onError,
  }) async {
    state = const AsyncData(SubmittingQuizProgressState());
    state = await AsyncValue.guard(
      () async {
        final quizSubmitResult = await ref.watch(apiHelperProvider).submitQuizProgress(
              quizProgress: quizProgress,
              videoId: videoId,
            );

        return quizSubmitResult.when((submitQuizResponse) async {
          if (submitQuizResponse.data?.id != null) {
            // Call the success callback
            onQuizSubmitted(submitQuizResponse);

            return const SubmittedQuizProgressState();
          } else {
            return const NotSubmittedState();
          }
        }, (error) {
          onError(error);
          return SubmitQuizErrorState(
            error.errorMessage,
          );
        });
      },
    );
  }
}
