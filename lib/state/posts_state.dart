import 'package:flutter_workshop/data/post.dart';

/// All the states the posts screen can be in.
///
/// sealed means a closed list of subclasses. The compiler knows all of them,
/// so a switch over the state has to handle every case.
sealed class PostsState {
  const PostsState();
}

final class PostsInitial extends PostsState {
  const PostsInitial();
}

final class PostsLoading extends PostsState {
  const PostsLoading();
}

final class PostsLoaded extends PostsState {
  const PostsLoaded(this.posts);

  final List<Post> posts;
}

final class PostsFailure extends PostsState {
  const PostsFailure(this.message);

  final String message;
}
