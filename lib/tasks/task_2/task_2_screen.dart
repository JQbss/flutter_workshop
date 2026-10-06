import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';

/// TASK 2
///
/// Tapping the heart does nothing. It should increase the like counter,
/// and the new number should show up on screen right away.
///
/// Need a reminder? See lib/basics/stateful_screen.dart.
class Task2Screen extends StatefulWidget {
  const Task2Screen({super.key});

  @override
  State<Task2Screen> createState() => _Task2ScreenState();
}

class _Task2ScreenState extends State<Task2Screen> {
  final int _likes = 0;

  void _like() {
    // TODO(task 2): make the like count go up.
  }

  @override
  Widget build(BuildContext context) {
    return StepScaffold(
      title: 'Task 2',
      solutionPath: '/tasks/2/solution',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 64,
              color: Colors.red,
              icon: const Icon(Icons.favorite),
              onPressed: _like,
            ),
            Text(
              'Likes: $_likes',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
