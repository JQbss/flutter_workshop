import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';

/// Everything in Flutter is a widget: text, spacing, a button, a whole screen.
///
/// A StatelessWidget has no state of its own. It receives data in the constructor
/// and describes what it should look like in the build method.
class WidgetsScreen extends StatelessWidget {
  const WidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Change any text or color below and save the file (Ctrl+S).
    // Hot reload swaps the code in the running app in a fraction of a second.
    return const StepScaffold(
      title: 'Widget',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flutter_dash, size: 96, color: Colors.indigo),
            Text('Hello, Flutter!', style: TextStyle(fontSize: 28)),
            // A custom widget is used exactly like the built-in ones.
            Pill(label: 'StatelessWidget'),
            Pill(label: 'build()', color: Colors.teal),
          ],
        ),
      ),
    );
  }
}

/// A custom widget: a small colored pill with a label.
class Pill extends StatelessWidget {
  const Pill({super.key, required this.label, this.color = Colors.indigo});

  // Widget fields are always final. A widget is an immutable description of a piece of UI.
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}
