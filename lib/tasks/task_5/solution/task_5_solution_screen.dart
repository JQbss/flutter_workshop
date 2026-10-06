import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';
import 'package:flutter_workshop/tasks/task_5/solution/solution_post.dart';
import 'package:flutter_workshop/tasks/task_5/task_5_screen.dart';

class Task5SolutionScreen extends StatelessWidget {
  const Task5SolutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final post = SolutionPost.fromJson(taskPostJson);

    return StepScaffold(
      title: 'Task 5: solution',
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'JSON from the server',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text('$taskPostJson'),
          const SizedBox(height: 24),
          Text(
            'Object after SolutionPost.fromJson',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text('$post'),
        ],
      ),
    );
  }
}
