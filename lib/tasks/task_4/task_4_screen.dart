import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/post_tile.dart';
import 'package:flutter_workshop/common/sample_posts.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';

/// TASK 4
///
/// Tapping a post does nothing. It should open that post's details screen
/// under its own address, e.g. /tasks/4/posts/3, with a working back arrow.
/// The details screen is ready: Task4PostScreen in task_4_post_screen.dart.
///
/// Two places need a change: this file and lib/router/app_router.dart.
/// Need a reminder? See how the /routing/items/:id route is set up and opened.
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
              // TODO(task 4): open the details screen of this post.
            },
          );
        },
      ),
    );
  }
}
