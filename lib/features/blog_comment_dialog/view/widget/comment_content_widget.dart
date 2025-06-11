import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/data/model/blog_comment_model.dart';
import 'package:flutter/material.dart';

class CommentContentWidget extends StatelessWidget {
  final BlogCommentData comment;

  const CommentContentWidget({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      comment.comment,
      style: TextStyle(
        fontSize: 15,
        height: 1.4,
        color: AppColors.kPrimaryColor.withValues(alpha: 0.8),
      ),
    );
  }
}
