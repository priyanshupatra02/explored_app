import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/data/model/subscription_plan_model.dart';
import 'package:flutter/material.dart';

class PlanPricing extends StatelessWidget {
  final SubscriptionPlanModel plan;

  const PlanPricing({
    super.key,
    required this.plan,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          plan.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          plan.price1,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                color: AppColors.kPrimaryWhiteColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              plan.price2 ?? '',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  color: AppColors.kPrimaryWhiteColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              plan.period ?? '',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 10,
                    color: AppColors.kPrimaryWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
