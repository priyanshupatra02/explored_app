import 'package:edtech_app/features/plan/view/widget/header_content.dart';
import 'package:edtech_app/features/plan/view/widget/navigation_bar.dart';
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
    return Container(
      padding: EdgeInsets.fromLTRB(20, 60, 20, 30),
      child: Column(
        children: [
          SubscriptionPageNavigationBar(onBackPressed: onBackPressed),
          SizedBox(height: 20),
          SlideTransition(
            position: slideAnimation,
            child: HeaderContent(),
          ),
        ],
      ),
    );
  }
}
