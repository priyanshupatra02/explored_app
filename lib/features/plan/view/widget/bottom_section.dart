import 'package:edtech_app/data/model/subscription_plan_model.dart';
import 'package:edtech_app/features/plan/view/widget/plan_indicators.dart';
import 'package:edtech_app/features/plan/view/subscription_plans_page.dart';
import 'package:edtech_app/features/plan/view/widget/subscribe_button.dart';
import 'package:flutter/material.dart';

class BottomSection extends StatelessWidget {
  final AnimationController slideController;
  final List<SubscriptionPlanModel> plans;
  final int currentIndex;
  final VoidCallback onSubscribe;

  const BottomSection({
    super.key,
    required this.slideController,
    required this.plans,
    required this.currentIndex,
    required this.onSubscribe,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: slideController,
        curve: Interval(0.5, 1.0, curve: Curves.easeOut),
      )),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            PlanIndicators(
              plans: plans,
              currentIndex: currentIndex,
            ),
            SizedBox(height: 30),
            SubscribeButton(
              plan: plans[currentIndex],
              onPressed: onSubscribe,
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
