import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/update_user/const/update_user_constants.dart';
import 'package:edtech_app/features/update_user/view/widgets/numbered_bullet_widget.dart';
import 'package:flutter/material.dart';

class QuestionsHeaderWidget extends StatelessWidget {
  final int questionNumber;
  const QuestionsHeaderWidget({
    super.key,
    required this.questionNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 4,
      children: [
        NumberedBulletWidget(
          questionNumber: (questionNumber + 1).toString(),
        ),
        // Question text
        Expanded(
          child: Text(
            questions[questionNumber],
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.kPrimaryColor,
                ),
          ),
        ),
      ],
    );
  }
}
