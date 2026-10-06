import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop/data/posts_repository.dart';
import 'package:flutter_workshop/state/posts_event.dart';
import 'package:flutter_workshop/state/posts_state.dart';

/// A Bloc turns a stream of events into a stream of states.
///
/// `Bloc<PostsEvent, PostsState>`: the first type is the input, the second is the output.
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  // super(...) sets the initial state.
  PostsBloc(this._repository) : super(const PostsInitial()) {
    // on<Event> registers the function that handles a given event type.
    on<PostsRequested>(_onRequested);
    on<PostsFailureSimulated>(_onFailureSimulated);
  }

  final PostsRepository _repository;

  Future<void> _onRequested(
    PostsRequested event,
    Emitter<PostsState> emit,
  ) async {
    // emit sends a new state to all listening widgets.
    emit(const PostsLoading());

    try {
      final posts = await _repository.fetchPosts();
      emit(PostsLoaded(posts));
    } on PostsException catch (error) {
      emit(PostsFailure(error.message));
    }
  }

  void _onFailureSimulated(
    PostsFailureSimulated event,
    Emitter<PostsState> emit,
  ) {
    emit(const PostsFailure('Simulated failure'));
  }
}
