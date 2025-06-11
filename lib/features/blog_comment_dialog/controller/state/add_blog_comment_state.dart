sealed class BlogCommentState {
  const BlogCommentState();
}

class InitialBlogCommentState extends BlogCommentState {
  const InitialBlogCommentState();
}

class CommentingState extends BlogCommentState {
  const CommentingState();
}

class CommentedState extends BlogCommentState {
  const CommentedState();
}

class NotCommentedState extends BlogCommentState {
  const NotCommentedState();
}

class BlogCommentErrorState extends BlogCommentState {
  final String message;
  const BlogCommentErrorState(this.message);
}