import 'package:flutter_riverpod/flutter_riverpod.dart';

final iconStudentColorProvider = StateProvider.autoDispose<bool>(
  (ref) {
    return false;
  },
  name: 'iconStudentColorProvider',
);
final iconUGColorProvider = StateProvider.autoDispose<bool>(
  (ref) {
    return false;
  },
  name: 'iconUGColorProvider',
);
