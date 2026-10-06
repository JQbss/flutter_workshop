import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';

/// A StatefulWidget consists of two classes: the immutable widget
/// and a State object that lives longer and holds the changing data.
class StatefulScreen extends StatefulWidget {
  const StatefulScreen({super.key});

  @override
  State<StatefulScreen> createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  int _counter = 0;

  void _incrementWithSetState() {
    // setState tells Flutter: "the state has changed, call build again".
    setState(() {
      _counter++;
    });
  }

  void _incrementWithoutSetState() {
    // The value changes, but Flutter does not know about it, so the screen is not refreshed.
    // The new value shows up only on the next build.
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    return StepScaffold(
      title: 'State',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter:'),
            Text('$_counter', style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _incrementWithSetState,
              child: const Text('+1 with setState'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: _incrementWithoutSetState,
              child: const Text('+1 without setState'),
            ),
          ],
        ),
      ),
    );
  }
}
