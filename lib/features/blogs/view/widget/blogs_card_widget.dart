import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/features/blogs/view/widget/read_more_button.dart';
import 'package:edtech_app/shared/widget/horizontal_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:velocity_x/velocity_x.dart';

class BlogsCardWidget extends StatelessWidget {
  final String authorName;
  final String timeAgo;
  final String title;
  final String description;
  final int blogId;
  final VoidCallback onReadMoreTap;

  const BlogsCardWidget({
    super.key,
    required this.authorName,
    required this.timeAgo,
    required this.title,
    required this.description,
    // this.authorImageUrl,
    required this.onReadMoreTap,
    required this.blogId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kGrey100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.kGrey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Author info row
            Row(
              children: [
                // // Author image
                // CircleAvatar(
                //   radius: 24,
                //   backgroundImage: authorImageUrl != null ? NetworkImage(authorImageUrl!) : null,
                //   backgroundColor: AppColors.kPrimaryColor,
                //   child: authorImageUrl == null
                //       ? const Icon(Icons.person, color: AppColors.kPrimaryWhiteColor)
                //       : null,
                // ),
                // 12.widthBox,
                // Author name
                Text(
                  authorName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    letterSpacing: 0.5,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                const Spacer(),
                // Time ago
                Text(
                  timeAgo,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    letterSpacing: 0.5,
                    color: AppColors.kGrey500,
                  ),
                ),
              ],
            ),
            HorizontalDividerWidget(),
            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
                color: AppColors.kPrimaryColor,
              ),
            ),
            20.heightBox,
            // Description
            Text(
              description,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                letterSpacing: 0.5,
                color: AppColors.kPrimaryColor,
              ),
            ),
            30.heightBox,
            // Read more button
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: ReadMoreButton(
                    onReadMoreTap: onReadMoreTap,
                  ),
                ),
                10.widthBox,
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      context.navigateTo(
                        BlogCommentDialogRoute(
                          blogId: blogId,
                          blogTitle: title,
                        ),
                      );
                    },
                    child: HugeIcon(
                      icon: AppIcons.strokeRoundedCommentAdd02,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
