import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';

class Task1SolutionScreen extends StatelessWidget {
  const Task1SolutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const StepScaffold(
      title: 'Task 1: solution',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'My first screen',
              style: TextStyle(fontSize: 28, color: Colors.teal),
            ),
            Text('A second widget in the same column'),
          ],
        ),
      ),
    );
  }
}
