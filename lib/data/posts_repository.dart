import 'package:dio/dio.dart';
import 'package:flutter_workshop/data/post.dart';
import 'package:flutter_workshop/data/posts_api.dart';

/// An error in the app's own terms. The rest of the code does not need to know about Dio.
class PostsException implements Exception {
  const PostsException(this.message);

  final String message;

  @override
  String toString() => message;
}

/// The repository is the only place through which the app reaches for posts.
/// It hides the data source (here: the API) and translates technical errors
/// into [PostsException].
class PostsRepository {
  PostsRepository(this._api);

  final PostsApi _api;

  Future<List<Post>> fetchPosts() async {
    try {
      return await _api.getPosts();
    } on DioException catch (error) {
      throw PostsException(_describe(error));
    }
  }

  Future<Post> fetchPost(int id) async {
    try {
      return await _api.getPost(id);
    } on DioException catch (error) {
      throw PostsException(_describe(error));
    }
  }

  String _describe(DioException error) {
    return switch (error.type) {
      DioExceptionType.connectionError ||
      DioExceptionType.connectionTimeout => 'No connection to the server',
      DioExceptionType.badResponse =>
        'The server responded with error ${error.response?.statusCode}',
      _ => 'Failed to fetch the data',
    };
  }
}
