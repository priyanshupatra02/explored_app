import 'package:flutter_riverpod/flutter_riverpod.dart';

final textMagnifyProvider = StateNotifierProvider<TextMagnifyController, double>(
  (ref) {
    return TextMagnifyController();
  },
  name: 'textMagnifyProvider',
);

class TextMagnifyController extends StateNotifier<double> {
  TextMagnifyController() : super(0.9);

  void magnifyText() {
    state = state + 0.1;
  }

  void minimizeText() {
    state = state - 0.1;
  }
}
