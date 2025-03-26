import 'package:flutter_riverpod/flutter_riverpod.dart';

final isAgreedToTermsAndConditionsProvider = StateNotifierProvider<IsAgreedToTermsAndConditionsController,bool>(
  (ref) {
    return IsAgreedToTermsAndConditionsController();
  },
  name: 'isAgreedToTermsAndConditionsProvider',
);


class IsAgreedToTermsAndConditionsController extends StateNotifier<bool> {
  IsAgreedToTermsAndConditionsController() : super(false);

  void toggle() {
    state = !state;
  }
}