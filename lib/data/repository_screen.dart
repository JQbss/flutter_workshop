import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';
import 'package:flutter_workshop/data/posts_repository.dart';

/// The screen talks to the repository, not to the API.
/// It knows nothing about Dio or URLs, and the only error it sees is [PostsException].
class RepositoryScreen extends StatefulWidget {
  const RepositoryScreen({super.key});

  @override
  State<RepositoryScreen> createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen> {
  String _result = 'Pick one of the actions.';

  Future<void> _fetch(int id) async {
    // The repository was created in app.dart (RepositoryProvider).
    final repository = context.read<PostsRepository>();

    String result;
    try {
      final post = await repository.fetchPost(id);
      result = 'Fetched: ${post.title}';
    } on PostsException catch (error) {
      result = 'PostsException: ${error.message}';
    }

    if (!mounted) return;
    setState(() => _result = result);
  }

  @override
  Widget build(BuildContext context) {
    return StepScaffold(
      title: 'Repository',
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton(
              onPressed: () => _fetch(1),
              child: const Text('fetchPost(1)'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              // A post with id 0 does not exist, so the server returns 404.
              onPressed: () => _fetch(0),
              child: const Text('fetchPost(0), i.e. a 404 error'),
            ),
            const SizedBox(height: 24),
            Text(_result, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
