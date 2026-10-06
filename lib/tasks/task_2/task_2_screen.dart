import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';

/// TASK 2 (4 min)
///
/// Make tapping the heart increase the like counter by 1
/// and make the new value show up on screen right away.
class Task2Screen extends StatefulWidget {
  const Task2Screen({super.key});

  @override
  State<Task2Screen> createState() => _Task2ScreenState();
}

class _Task2ScreenState extends State<Task2Screen> {
  final int _likes = 0;

  void _like() {
    // TODO(task 2): increase _likes by 1 inside setState.
    // Hint: the _likes field can no longer be final then.
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
