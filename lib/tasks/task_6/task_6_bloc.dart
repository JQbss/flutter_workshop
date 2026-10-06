import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop/data/posts_repository.dart';
import 'package:flutter_workshop/state/posts_event.dart';
import 'package:flutter_workshop/state/posts_state.dart';

/// TASK 6
///
/// The "Fetch posts" button sends a PostsRequested event, but the screen stays on
/// "Nothing fetched yet". It should show a spinner while the posts are loading
/// and the list once they arrive. The view is ready, only this Bloc needs work.
///
/// Optional: make the screen show a message when fetching fails.
class Task6Bloc extends Bloc<PostsEvent, PostsState> {
  Task6Bloc(this._repository) : super(const PostsInitial()) {
    on<PostsRequested>(_onRequested);
  }

  final PostsRepository _repository;

  Future<void> _onRequested(
    PostsRequested event,
    Emitter<PostsState> emit,
  ) async {
    // TODO(task 6): the posts are fetched, but nobody ever hears about it.
    await _repository.fetchPosts();
  }
}
