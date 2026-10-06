import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/sample_posts.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';

/// The ready-made details screen for task 4. It gets the post number from the route.
class Task4PostScreen extends StatelessWidget {
  const Task4PostScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    final post = samplePosts[id - 1];

    return StepScaffold(
      title: 'Post $id',
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            Text(post.body),
          ],
        ),
      ),
    );
  }
}
