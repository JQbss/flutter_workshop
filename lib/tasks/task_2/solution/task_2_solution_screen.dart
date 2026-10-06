import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';

class Task2SolutionScreen extends StatefulWidget {
  const Task2SolutionScreen({super.key});

  @override
  State<Task2SolutionScreen> createState() => _Task2SolutionScreenState();
}

class _Task2SolutionScreenState extends State<Task2SolutionScreen> {
  int _likes = 0;

  void _like() {
    setState(() {
      _likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StepScaffold(
      title: 'Task 2: solution',
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
