import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TermsAndConditionsPage extends StatelessWidget {
  final String url;
  const TermsAndConditionsPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return TermsAndConditionsView(url: url,);
  }
}

class TermsAndConditionsView extends StatelessWidget {
  final String url;
  const TermsAndConditionsView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
