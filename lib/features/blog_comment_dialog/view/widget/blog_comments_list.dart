import 'package:edtech_app/data/model/blog_comment_model.dart';
import 'package:edtech_app/features/blog_comment_dialog/view/widget/blog_comment_item.dart';
import 'package:flutter/material.dart';

class BlogCommentsList extends StatelessWidget {
  final List<BlogCommentData> comments;

  const BlogCommentsList({
    super.key,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      initialItemCount: comments.length,
      itemBuilder: (context, index, animation) {
        return BlogCommentItem(
          comment: comments[index],
          animation: animation,
        );
      },
    );
  }
}
