import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/post_tile.dart';
import 'package:flutter_workshop/common/sample_posts.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';

/// TASK 3 (4 min)
///
/// The screen shows only 3 posts typed in by hand, while samplePosts has 30.
/// Replace the Column with a ListView.builder that displays all of them.
class Task3Screen extends StatelessWidget {
  const Task3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return StepScaffold(
      title: 'Task 3',
      solutionPath: '/tasks/3/solution',
      // TODO(task 3): replace the Column with a ListView.builder.
      // You need itemCount (samplePosts.length) and an itemBuilder
      // that returns a PostTile for the given index.
      child: Column(
        children: [
          PostTile(title: samplePosts[0].title, body: samplePosts[0].body),
          PostTile(title: samplePosts[1].title, body: samplePosts[1].body),
          PostTile(title: samplePosts[2].title, body: samplePosts[2].body),
        ],
      ),
    );
  }
}
