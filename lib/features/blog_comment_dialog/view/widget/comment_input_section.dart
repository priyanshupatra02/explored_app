import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/blog_comment_dialog/controller/pod/add_blog_comment_pod.dart';
import 'package:edtech_app/features/blog_comment_dialog/controller/state/add_blog_comment_state.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:velocity_x/velocity_x.dart';

class CommentInputSection extends ConsumerWidget {
  final int blogId;
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSend;

  const CommentInputSection({
    super.key,
    required this.blogId,
    required this.controller,
    required this.focusNode,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addCommentAsync = ref.watch(addBlogCommentProvider);

    return Container(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryWhiteColor,
        border: Border(
          top: BorderSide(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: addCommentAsync.easyWhen(
          data: (commentState) {
            final isCommenting = commentState is CommentingState;
            final isEnabled = !isCommenting && controller.text.trim().isNotEmpty;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 48,
                      maxHeight: 120,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.kLightSecondaryColor.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: AppColors.kLightSecondaryColor.withValues(alpha: 0.5),
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      controller: controller,
                      focusNode: focusNode,
                      enabled: !isCommenting,
                      maxLines: null,
                      minLines: 1,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.newline,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.kPrimaryColor,
                      ),
                      decoration: InputDecoration(
                        hintText: isCommenting ? 'Adding comment...' : 'Write a comment...',
                        hintStyle: TextStyle(
                          color: AppColors.kGrey500,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        isDense: true,
                      ),
                      onChanged: (value) {
                        // Trigger rebuild to update send button state
                        (context as Element).markNeedsBuild();
                      },
                      onTap: () {
                        if (!focusNode.hasFocus) {
                          focusNode.requestFocus();
                        }
                      },
                    ),
                  ),
                ),
                12.widthBox,
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isEnabled ? AppColors.kPrimaryColor : AppColors.kGrey300,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: isEnabled
                        ? [
                            BoxShadow(
                              color: AppColors.kPrimaryColor.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: isEnabled ? onSend : null,
                      child: Center(
                        child: isCommenting
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.kPrimaryWhiteColor,
                                  ),
                                ),
                              )
                            : HugeIcon(
                                icon: HugeIcons.strokeRoundedSent,
                                color:
                                    isEnabled ? AppColors.kPrimaryWhiteColor : AppColors.kGrey500,
                                size: 20,
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
