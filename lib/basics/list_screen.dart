import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';

/// ListView.builder builds items lazily: only the ones visible on screen.
/// That is why a list of 10,000 items is as smooth as a list of 10.
class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StepScaffold(
      title: 'List',
      child: ListView.builder(
        itemCount: 10000,
        // itemBuilder is called for every item that scrolls into view.
        // Uncomment debugPrint and scroll the list to see it in the console.
        itemBuilder: (context, index) {
          // debugPrint('Building item $index');
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text('Item number ${index + 1}'),
          );
        },
      ),
    );
  }
}
