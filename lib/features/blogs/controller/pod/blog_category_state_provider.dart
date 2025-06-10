import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogCategoryPod = StateProvider.autoDispose<String>(
  (ref) {
    return "";
  },
  name: 'blogCategoryPod',
);
