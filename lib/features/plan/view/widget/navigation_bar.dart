import 'package:flutter/material.dart';

class SubscriptionPageNavigationBar extends StatelessWidget {
  final VoidCallback onBackPressed;

  const SubscriptionPageNavigationBar({
    super.key,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: onBackPressed,
        ),
        Spacer(),
        Icon(Icons.more_vert, color: Colors.white),
      ],
    );
  }
}
