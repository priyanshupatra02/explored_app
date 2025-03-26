import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PrivacyAndPolicyPage extends StatelessWidget {
  const PrivacyAndPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PrivacyPolicyView();
  }
}

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
