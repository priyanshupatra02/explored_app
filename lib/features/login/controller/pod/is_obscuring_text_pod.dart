import 'package:flutter_riverpod/flutter_riverpod.dart';


final isObscuringTextProvider = StateNotifierProvider<IsObscuringTextController, bool>(
  (ref) {
    return IsObscuringTextController();
  },
  name: 'isObscuringTextProvider',
);

class IsObscuringTextController extends StateNotifier<bool> {
  IsObscuringTextController() : super(false);

  void toggle() {
    state = !state;
  }
}
