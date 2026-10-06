import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Shared frame for every workshop step: an app bar with a title and the content.
///
/// Task screens pass [solutionPath] and get a "Solution" button.
class StepScaffold extends StatelessWidget {
  const StepScaffold({
    super.key,
    required this.title,
    required this.child,
    this.solutionPath,
  });

  final String title;
  final Widget child;
  final String? solutionPath;

  @override
  Widget build(BuildContext context) {
    final solutionPath = this.solutionPath;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          if (solutionPath != null)
            TextButton(
              onPressed: () => context.push(solutionPath),
              child: const Text('Solution'),
            ),
        ],
      ),
      body: SafeArea(child: child),
    );
  }
}
