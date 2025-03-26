import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForumsPage extends StatelessWidget {
  const ForumsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ForumsView();
  }
}

class ForumsView extends StatelessWidget {
  const ForumsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
} 
