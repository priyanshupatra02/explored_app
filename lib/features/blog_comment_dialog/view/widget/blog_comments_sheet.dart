import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/data/model/blog_comment_model.dart';
import 'package:edtech_app/features/blog_comment_dialog/controller/pod/add_blog_comment_pod.dart';
import 'package:edtech_app/features/blog_comment_dialog/view/widget/blog_comments_header.dart';
import 'package:edtech_app/features/blog_comment_dialog/view/widget/blog_comments_list.dart';
import 'package:edtech_app/features/blog_comment_dialog/view/widget/comment_input_section.dart';
import 'package:edtech_app/features/blog_comment_dialog/view/widget/empty_comments_widget.dart';
import 'package:edtech_app/shared/helper/global_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogCommentsSheet extends ConsumerStatefulWidget {
  final int blogId;
  final List<BlogCommentData> comments;
  final String blogTitle;

  const BlogCommentsSheet({
    super.key,
    required this.blogId,
    required this.comments,
    required this.blogTitle,
  });

  @override
  ConsumerState<BlogCommentsSheet> createState() => _BlogCommentsSheetState();
}

class _BlogCommentsSheetState extends ConsumerState<BlogCommentsSheet> with GlobalHelper {
  late TextEditingController _commentController;
  late FocusNode _commentFocusNode;

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
    _commentFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _commentController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }

  void addComment() {
    if (_commentController.text.trim().isEmpty) {
      showErrorSnack(child: Text('Please enter a comment'));
      return;
    }

    final comment = _commentController.text.trim();

    //call the async notifier to add comment
    ref.read(addBlogCommentProvider.notifier).addBlogComment(
          comment: comment,
          blogId: widget.blogId,
          onCommentAdded: (blogCommentResponse) {
            //clear the text field
            _commentController.clear();
            _commentFocusNode.unfocus();
            //refresh the comments list
            // ref.invalidate(blogCommentsProvider(widget.blogId));
            //show success message
            showSuccessSnack(child: Text('Comment added successfully!'));
          },
        );
    // ref.invalidate(blogCommentsProvider(widget.blogId));
  }

  @override
  Widget build(BuildContext context) {
    // Get keyboard height for proper padding
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: AppColors.kPrimaryWhiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            margin: EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          BlogCommentsHeader(
            blogTitle: widget.blogTitle,
            commentsCount: widget.comments.length,
          ),
          Expanded(
            child: widget.comments.isEmpty
                ? EmptyCommentsWidget()
                : BlogCommentsList(comments: widget.comments),
          ),
          // Animated padding based on keyboard height
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            padding: EdgeInsets.only(bottom: keyboardHeight),
            child: CommentInputSection(
              blogId: widget.blogId,
              controller: _commentController,
              focusNode: _commentFocusNode,
              onSend: addComment,
            ),
          ),
        ],
      ),
    );
  }
}
