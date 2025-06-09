import 'package:edtech_app/data/model/subscription_plan_model.dart';
import 'package:edtech_app/features/plan/view/widget/plan_card.dart';
import 'package:flutter/material.dart';

class PlansSection extends StatelessWidget {
  final PageController pageController;
  final List<SubscriptionPlanModel> plans;
  final int currentIndex;
  final Function(int) onPageChanged;

  const PlansSection({
    super.key,
    required this.pageController,
    required this.plans,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: plans.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              double value = 1.0;
              if (pageController.position.haveDimensions) {
                value = pageController.page! - index;
                value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
              }

              return Transform.scale(
                scale: value,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: PlanCard(
                    plan: plans[index],
                    isActive: index == currentIndex,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
