import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';

/// A layout is built by nesting widgets:
/// Column lays children out vertically, Row horizontally,
/// Expanded takes the free space, Padding adds spacing.
class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const StepScaffold(
      title: 'Layout',
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          // The main axis of a Column is vertical, the cross axis is horizontal.
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PostCard(),
            SizedBox(height: 16),
            _Proportions(),
          ],
        ),
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(child: Icon(Icons.person)),
            const SizedBox(width: 12),
            // Without Expanded a long text would overflow the screen (yellow-black stripes).
            // Expanded gives the column all the width its siblings did not take.
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Post title',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'The post body is long enough that it does not fit '
                    'on a single line and has to wrap onto the next one.',
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            const Icon(Icons.favorite_border),
          ],
        ),
      ),
    );
  }
}

class _Proportions extends StatelessWidget {
  const _Proportions();

  @override
  Widget build(BuildContext context) {
    // flex splits the free space in a 1 : 2 ratio.
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 48,
            color: Colors.indigo.shade200,
            alignment: Alignment.center,
            child: const Text('flex: 1'),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 48,
            color: Colors.teal.shade200,
            alignment: Alignment.center,
            child: const Text('flex: 2'),
          ),
        ),
      ],
    );
  }
}
