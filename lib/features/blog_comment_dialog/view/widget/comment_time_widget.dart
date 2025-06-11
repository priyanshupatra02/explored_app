import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:velocity_x/velocity_x.dart';

class CommentTimeWidget extends StatelessWidget {
  final int commentId;

  const CommentTimeWidget({
    super.key,
    required this.commentId,
  });

  @override
  Widget build(BuildContext context) {
    String timeAgo = "Just now";

    return Row(
      children: [
        HugeIcon(
          icon: HugeIcons.strokeRoundedClock01,
          color: AppColors.kGrey500,
          size: 14,
        ),
        4.widthBox,
        Text(
          timeAgo,
          style: TextStyle(
            fontSize: 13,
            color: AppColors.kGrey500,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.widthBox,
        Text(
          '#$commentId',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.kGrey500.withValues(alpha: 0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
