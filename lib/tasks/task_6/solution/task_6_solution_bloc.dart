import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop/data/posts_repository.dart';
import 'package:flutter_workshop/state/posts_event.dart';
import 'package:flutter_workshop/state/posts_state.dart';

class Task6SolutionBloc extends Bloc<PostsEvent, PostsState> {
  Task6SolutionBloc(this._repository) : super(const PostsInitial()) {
    on<PostsRequested>(_onRequested);
  }

  final PostsRepository _repository;

  Future<void> _onRequested(
    PostsRequested event,
    Emitter<PostsState> emit,
  ) async {
    emit(const PostsLoading());

    try {
      final posts = await _repository.fetchPosts();
      emit(PostsLoaded(posts));
    } on PostsException catch (error) {
      // The optional part.
      emit(PostsFailure(error.message));
    }
  }
}
