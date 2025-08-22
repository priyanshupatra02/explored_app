import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/data/model/blog_comment_model.dart';
import 'package:edtech_app/features/blog_comment_dialog/view/widget/comment_content_widget.dart';
import 'package:edtech_app/features/blog_comment_dialog/view/widget/comment_time_widget.dart';
import 'package:edtech_app/features/blog_comment_dialog/view/widget/user_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BlogCommentItem extends StatelessWidget {
  final BlogCommentData comment;
  final Animation<double> animation;

  const BlogCommentItem({
    super.key,
    required this.comment,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation.drive(
        Tween(begin: Offset(1.0, 0.0), end: Offset.zero).chain(
          CurveTween(curve: Curves.easeOutCubic),
        ),
      ),
      child: FadeTransition(
        opacity: animation,
        child: Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.kLightSecondaryColor.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.kLightSecondaryColor.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  UserAvatarWidget(
                    firstName: "Anonymous",
                    lastName: "User",
                  ),
                  12.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Anonymous User',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                        4.heightBox,
                        CommentTimeWidget(commentId: comment.id),
                      ],
                    ),
                  ),
                ],
              ),
              16.heightBox,
              CommentContentWidget(comment: comment),
            ],
          ),
        ),
      ),
    );
  }
}
