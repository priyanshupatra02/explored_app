import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class QuizWrapperPage extends StatelessWidget {
  const QuizWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return QuizWrapperView();
  }
}

class QuizWrapperView extends ConsumerWidget {
  const QuizWrapperView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This is a container for the nested routes
    return Scaffold(
      body: AutoRouter(),
    );
  }
}
