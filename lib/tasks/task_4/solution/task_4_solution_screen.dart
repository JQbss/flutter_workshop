import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/post_tile.dart';
import 'package:flutter_workshop/common/sample_posts.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';
import 'package:go_router/go_router.dart';

/// The route for this screen is in app_router.dart: 'solution' with a 'posts/:id' sub-route.
class Task4SolutionScreen extends StatelessWidget {
  const Task4SolutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StepScaffold(
      title: 'Task 4: solution',
      child: ListView.builder(
        itemCount: samplePosts.length,
        itemBuilder: (context, index) {
          final post = samplePosts[index];
          return PostTile(
            title: post.title,
            body: post.body,
            onTap: () => context.push('/tasks/4/solution/posts/${index + 1}'),
          );
        },
      ),
    );
  }
}
