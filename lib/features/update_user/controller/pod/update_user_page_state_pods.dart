import 'package:flutter_riverpod/flutter_riverpod.dart';

// Page 0: Role selection (what do you do?)
final roleSelectionProvider = StateProvider<String?>(
  (ref) => null,
  name: 'roleSelectionProvider',
);

// Page 1: Career interests answers captured as key -> value
final careerInterestsAnswersProvider = StateProvider<Map<String, String>>(
  (ref) => <String, String>{},
  name: 'careerInterestsAnswersProvider',
);

// Page 2: Selected career suggestion
final careerChoiceProvider = StateProvider<String?>(
  (ref) => null,
  name: 'careerChoiceProvider',
);

// Page 2: Selected master's degree program
final mastersCareerChoiceProvider = StateProvider<String?>(
  (ref) => null,
  name: 'mastersCareerChoiceProvider',
);
