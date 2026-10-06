import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';
import 'package:go_router/go_router.dart';

/// The route configuration lives in lib/router/app_router.dart.
///
/// go   - replaces the screen stack with the stack implied by the path.
/// push - puts a new screen on top of the current stack.
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StepScaffold(
      title: 'Navigation',
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Open the same screen in two ways and go back with the back '
              'arrow each time. See where you end up.',
            ),
            const SizedBox(height: 16),
            FilledButton(
              // Stack after go: [table of contents, item 1]. This screen leaves the stack.
              onPressed: () => context.go('/routing/items/1'),
              child: const Text("context.go('/routing/items/1')"),
            ),
            const SizedBox(height: 8),
            FilledButton.tonal(
              // Stack after push: [table of contents, navigation, item 1].
              onPressed: () => context.push('/routing/items/1'),
              child: const Text("context.push('/routing/items/1')"),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              // pop removes the top screen from the stack, just like the back arrow.
              onPressed: () => context.pop(),
              child: const Text('context.pop()'),
            ),
          ],
        ),
      ),
    );
  }
}
