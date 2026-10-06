/// Events are everything that can happen from the Bloc's point of view.
/// The UI does not change the state itself. It sends an event and the Bloc decides what next.
sealed class PostsEvent {
  const PostsEvent();
}

/// The user asked to fetch the posts.
final class PostsRequested extends PostsEvent {
  const PostsRequested();
}

/// An artificial event for the workshop: jump straight to the failure state.
final class PostsFailureSimulated extends PostsEvent {
  const PostsFailureSimulated();
}
