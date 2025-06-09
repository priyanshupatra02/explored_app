import 'package:flutter/material.dart';

class FeatureCheckmark extends StatelessWidget {
  final Color color;

  const FeatureCheckmark({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.check,
        color: color,
        size: 14,
      ),
    );
  }
}
