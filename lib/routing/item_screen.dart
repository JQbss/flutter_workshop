import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';
import 'package:go_router/go_router.dart';

/// The screen for the /routing/items/:id route.
///
/// The router extracts the :id value (state.pathParameters['id'])
/// and passes it to the screen as a regular constructor parameter.
class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return StepScaffold(
      title: 'Item $id',
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'id = $id',
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            Text(
              // The current location of the screen, like a URL in a browser.
              'Path: ${GoRouterState.of(context).uri}',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.tonal(
              // Every push adds a screen: back goes one item back.
              onPressed: () => context.push('/routing/items/${id + 1}'),
              child: const Text('Next with push'),
            ),
            const SizedBox(height: 8),
            FilledButton(
              // go replaces the stack: back returns straight to the table of contents.
              onPressed: () => context.go('/routing/items/${id + 1}'),
              child: const Text('Next with go'),
            ),
          ],
        ),
      ),
    );
  }
}
