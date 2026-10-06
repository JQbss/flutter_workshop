import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/post_tile.dart';
import 'package:flutter_workshop/common/sample_posts.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';

/// TASK 4 (5 min)
///
/// Tapping a post should open the details screen, e.g. /tasks/4/posts/3.
/// The details screen is ready: Task4PostScreen in task_4_post_screen.dart.
///
/// 1. In lib/router/app_router.dart add the 'posts/:id' route (marked spot).
/// 2. Here, in onTap, navigate to it with context.push.
class Task4Screen extends StatelessWidget {
  const Task4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return StepScaffold(
      title: 'Task 4',
      solutionPath: '/tasks/4/solution',
      child: ListView.builder(
        itemCount: samplePosts.length,
        itemBuilder: (context, index) {
          final post = samplePosts[index];
          return PostTile(
            title: post.title,
            body: post.body,
            onTap: () {
              // TODO(task 4): context.push('/tasks/4/posts/${index + 1}');
              // You will need to import package:go_router/go_router.dart.
            },
          );
        },
      ),
    );
  }
}
