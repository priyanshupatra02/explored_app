import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/data/model/subscription_plan_model.dart';
import 'package:flutter/material.dart';

class PlanIndicators extends StatelessWidget {
  final List<SubscriptionPlanModel> plans;
  final int currentIndex;

  const PlanIndicators({
    super.key,
    required this.plans,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(plans.length, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: index == currentIndex ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: index == currentIndex ? plans[currentIndex].color : AppColors.kGrey400,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
