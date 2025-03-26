import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class StringBulletList extends StatelessWidget {
  final List<String> items;

  const StringBulletList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' • ',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    height: 0.85,
                    color: AppColors.kPrimaryColor,
                  ),
            ),
            Expanded(
              child: Text(
                items[index],
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.kPrimaryColor,
                      fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
          ],

        ).py4();
      },
    );
  }
}
