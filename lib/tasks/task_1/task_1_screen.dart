import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';

/// TASK 1
///
/// 1. Change the greeting text to your own.
/// 2. Change the text color (e.g. Colors.teal).
/// 3. Add a second Text widget below with any content.
///
/// Save the file after each change and watch hot reload.
class Task1Screen extends StatelessWidget {
  const Task1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const StepScaffold(
      title: 'Task 1',
      solutionPath: '/tasks/1/solution',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO(task 1): change the text and color, add a second Text.
            Text(
              'Hello, Flutter!',
              style: TextStyle(fontSize: 28, color: Colors.indigo),
            ),
          ],
        ),
      ),
    );
  }
}
