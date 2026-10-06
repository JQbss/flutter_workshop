import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop/data/posts_repository.dart';
import 'package:flutter_workshop/state/posts_event.dart';
import 'package:flutter_workshop/state/posts_state.dart';

/// TASK 6
///
/// The "Fetch posts" button sends a PostsRequested event, but the state never changes,
/// because the handler does not emit anything. Complete it.
class Task6Bloc extends Bloc<PostsEvent, PostsState> {
  Task6Bloc(this._repository) : super(const PostsInitial()) {
    on<PostsRequested>(_onRequested);
  }

  final PostsRepository _repository;

  Future<void> _onRequested(
    PostsRequested event,
    Emitter<PostsState> emit,
  ) async {
    // TODO(task 6):
    // 1. Emit the PostsLoading state before fetching.
    // 2. Store the result of fetchPosts() in a variable.
    // 3. Emit PostsLoaded with the fetched posts.
    // Optional: catch PostsException and emit PostsFailure.
    await _repository.fetchPosts();
  }
}
