import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';

const _seedColors = [Colors.indigo, Colors.teal, Colors.deepOrange, Colors.pink];

/// ThemeData describes the look of the app: colors, typography, shapes.
/// Widgets read it with Theme.of(context) instead of hardcoding colors.
class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  Color _seedColor = _seedColors.first;

  @override
  Widget build(BuildContext context) {
    return StepScaffold(
      title: 'Theme',
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Pick the seed color of the theme:'),
            const SizedBox(height: 8),
            Row(
              children: [
                for (final color in _seedColors)
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: InkWell(
                      onTap: () => setState(() => _seedColor = color),
                      child: CircleAvatar(
                        backgroundColor: color,
                        child: color == _seedColor
                            ? const Icon(Icons.check, color: Colors.white)
                            : null,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 24),
            // The Theme widget overrides the theme for everything below it.
            // ColorScheme.fromSeed derives a whole palette from a single color.
            Theme(
              data: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: _seedColor),
              ),
              child: const _Preview(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Preview extends StatelessWidget {
  const _Preview();

  @override
  Widget build(BuildContext context) {
    // Theme.of(context) looks up the nearest theme going up the widget tree.
    // This context sits below the Theme widget, so we get the overridden theme.
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('headlineSmall', style: theme.textTheme.headlineSmall),
            Text(
              'Background color: colorScheme.primaryContainer',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 12),
            // Buttons take their colors from the theme on their own.
            FilledButton(onPressed: () {}, child: const Text('FilledButton')),
          ],
        ),
      ),
    );
  }
}
