part of 'posts_cubit.dart';

enum PostsStatus { initial, loading, error, success }

class PostsState extends Equatable {
  const PostsState._(
      {this.posts = const <PostWithComments>[],
      // this.comments = const <Comment>[],
      this.status = PostsStatus.initial});
  final List<PostWithComments> posts;
  // final List<Comment> comments;
  final PostsStatus status;

  const PostsState.initial() : this._();
  const PostsState.loading() : this._(status: PostsStatus.loading);
  const PostsState.error() : this._(status: PostsStatus.error);
  const PostsState.success(List<PostWithComments> posts)
      : this._(posts: posts, status: PostsStatus.success);

  @override
  List<Object> get props => [posts, status];
}
