import 'package:edtech_app/features/plan/view/widget/feature_checkmark.dart';
import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  final String feature;
  final Color color;
  final int delay;

  const FeatureItem({
    super.key,
    required this.feature,
    required this.color,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300 + delay),
      curve: Curves.easeInOut,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            FeatureCheckmark(color: color),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                feature,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
