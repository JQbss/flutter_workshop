import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/post_tile.dart';
import 'package:flutter_workshop/common/sample_posts.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';

class Task3SolutionScreen extends StatelessWidget {
  const Task3SolutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StepScaffold(
      title: 'Task 3: solution',
      child: ListView.builder(
        itemCount: samplePosts.length,
        itemBuilder: (context, index) {
          final post = samplePosts[index];
          return PostTile(title: post.title, body: post.body);
        },
      ),
    );
  }
}
