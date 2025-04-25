import 'package:edtech_app/data/model/subject_list_model.dart';
import 'package:edtech_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final subjectProvider = FutureProvider.autoDispose<SubjectListModel>(
  (ref) async {
    final result = await ref.watch(apiHelperProvider).getSubjects();
    ref.keepAlive();
    return result.when(
      (subjectsModel) {
        return subjectsModel;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "subjectProvider",
);