import 'package:edtech_app/data/model/subscription_plan_model.dart';
import 'package:edtech_app/features/plan/view/widget/plan_features.dart';
import 'package:edtech_app/features/plan/view/widget/plan_header.dart';
import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  final SubscriptionPlanModel plan;
  final bool isActive;

  const PlanCard({
    super.key,
    required this.plan,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isActive ? plan.gradientColors : [Colors.grey[800]!, Colors.grey[700]!],
        ),
        boxShadow: [
          BoxShadow(
            color: isActive ? plan.color.withValues(alpha: 0.3) : Colors.black26,
            blurRadius: isActive ? 20 : 10,
            offset: Offset(0, isActive ? 10 : 5),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlanHeader(plan: plan),
            SizedBox(height: 30),
            Expanded(
              child: PlanFeatures(plan: plan),
            ),
          ],
        ),
      ),
    );
  }
}
