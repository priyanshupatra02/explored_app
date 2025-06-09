import 'package:edtech_app/data/model/subscription_plan_model.dart';
import 'package:edtech_app/features/plan/view/widget/feature_item.dart';
import 'package:flutter/material.dart';

class PlanFeatures extends StatelessWidget {
  final SubscriptionPlanModel plan;

  const PlanFeatures({
    super.key,
    required this.plan,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: plan.features.map((feature) {
        int index = plan.features.indexOf(feature);
        return FeatureItem(
          feature: feature,
          color: plan.color,
          delay: index * 100,
        );
      }).toList(),
    );
  }
}
