import 'package:edtech_app/features/plan/view/widget/header_content.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final VoidCallback onBackPressed;

  const HeaderSection({
    super.key,
    required this.slideAnimation,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: HeaderContent(),
    );
  }
}
