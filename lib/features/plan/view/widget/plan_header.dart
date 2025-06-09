import 'package:edtech_app/data/model/subscription_plan_model.dart';
import 'package:edtech_app/features/plan/view/widget/plan_pricing.dart';
import 'package:edtech_app/features/plan/view/widget/popular_badge.dart';
import 'package:flutter/material.dart';

class PlanHeader extends StatelessWidget {
  final SubscriptionPlanModel plan;

  const PlanHeader({
    super.key,
    required this.plan,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PlanPricing(plan: plan),
        if (plan.isPopular) PopularBadge(color: plan.color),
      ],
    );
  }
}
