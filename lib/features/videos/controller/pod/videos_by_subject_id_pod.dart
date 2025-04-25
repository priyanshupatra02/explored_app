import 'package:edtech_app/data/model/videos_list_model.dart';
import 'package:edtech_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final videosBySubjectIdProvider = FutureProvider.autoDispose.family<VideosModel, String>(
  (ref, subjectId) async {
    final result = await ref.watch(apiHelperProvider).getVideosBySubject(subjectId: subjectId);
    ref.keepAlive();
    return result.when(
      (videosModel) {
        return videosModel;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "videosBySubjectIdProvider",
);
