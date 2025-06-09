import 'package:flutter/material.dart';

class SubscriptionDialog extends StatelessWidget {
  final String planName;
  final Color planColor;

  const SubscriptionDialog({
    super.key,
    required this.planName,
    required this.planColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF1A1F3A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        "Subscription Confirmed!",
        style: TextStyle(color: Colors.white),
      ),
      content: Text(
        "Welcome to $planName plan! Your 7-day free trial starts now.",
        style: TextStyle(color: Colors.white70),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Get Started",
            style: TextStyle(color: planColor),
          ),
        ),
      ],
    );
  }
}
