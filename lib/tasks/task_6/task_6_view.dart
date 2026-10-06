import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/post_tile.dart';
import 'package:flutter_workshop/state/posts_state.dart';

/// The ready-made view for task 6: a button and content that depends on the state.
class Task6View extends StatelessWidget {
  const Task6View({super.key, required this.state, required this.onRequested});

  final PostsState state;
  final VoidCallback onRequested;

  @override
  Widget build(BuildContext context) {
    final state = this.state;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton(
            onPressed: onRequested,
            child: const Text('Fetch posts'),
          ),
        ),
        Text('Current state: ${state.runtimeType}'),
        Expanded(
          child: switch (state) {
            PostsInitial() => const Center(child: Text('Nothing fetched yet')),
            PostsLoading() => const Center(child: CircularProgressIndicator()),
            PostsLoaded(:final posts) => ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) => PostTile(
                title: posts[index].title,
                body: posts[index].body,
              ),
            ),
            PostsFailure(:final message) => Center(child: Text(message)),
          },
        ),
      ],
    );
  }
}
