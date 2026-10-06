import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/post_tile.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';
import 'package:flutter_workshop/data/post.dart';
import 'package:flutter_workshop/data/posts_api.dart';

/// Calling the API straight from the screen, with the state kept in setState.
///
/// It works, but the screen itself has to track loading, error and data.
/// In the "State" section we move this logic into a Bloc.
class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  final _api = PostsApi(Dio());

  bool _isLoading = false;
  String? _error;
  List<Post> _posts = const [];

  Future<void> _load() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // await waits for the response without blocking the UI.
      final posts = await _api.getPosts();
      // The user may have left the screen in the meantime.
      if (!mounted) return;
      setState(() => _posts = posts);
    } on DioException catch (error) {
      if (!mounted) return;
      setState(() => _error = error.message ?? 'Unknown error');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final error = _error;

    return StepScaffold(
      title: 'API',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton(
              onPressed: _isLoading ? null : _load,
              child: const Text('GET /posts'),
            ),
          ),
          if (_isLoading) const CircularProgressIndicator(),
          if (error != null) Text('Error: $error'),
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                final post = _posts[index];
                return PostTile(title: post.title, body: post.body);
              },
            ),
          ),
        ],
      ),
    );
  }
}
