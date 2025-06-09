import 'package:flutter/material.dart';

class SubscriptionPlanModel {
  final String name;
  final String price1;
  final String? price2;
  final String? period;
  final Color color;
  final List<Color> gradientColors;
  final List<String> features;
  final bool isPopular;

  SubscriptionPlanModel({
    this.price2,
    required this.name,
    required this.price1,
     this.period,
    required this.color,
    required this.gradientColors,
    required this.features,
    required this.isPopular,
  });
}
