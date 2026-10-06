import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop/data/posts_repository.dart';
import 'package:flutter_workshop/state/posts_state.dart';

/// A Cubit is a simplified Bloc: the same states, but no events.
/// Instead of add(Event) the UI calls regular methods.
///
/// Compare with posts_bloc.dart: the event classes and the `on<Event>` registration are gone.
class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this._repository) : super(const PostsInitial());

  final PostsRepository _repository;

  Future<void> load() async {
    emit(const PostsLoading());

    try {
      final posts = await _repository.fetchPosts();
      emit(PostsLoaded(posts));
    } on PostsException catch (error) {
      emit(PostsFailure(error.message));
    }
  }

  void simulateFailure() {
    emit(const PostsFailure('Simulated failure'));
  }
}
