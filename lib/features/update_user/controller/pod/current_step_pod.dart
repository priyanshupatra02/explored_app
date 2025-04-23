import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentStepPod = StateProvider.autoDispose<int>(
  (ref) {
    return 0;
  },
  name: 'currentStepPod',
);
