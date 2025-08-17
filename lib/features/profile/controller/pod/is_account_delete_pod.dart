import 'package:flutter_riverpod/flutter_riverpod.dart';

final isAccountDeleteProvider = StateProvider.autoDispose<bool>(
  (ref) {
    return false;
  },
  name: 'isAccountDeleteProvider',
);
