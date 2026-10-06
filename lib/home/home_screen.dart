import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class _Entry {
  const _Entry(this.title, this.subtitle, this.path, {this.isTask = false});

  final String title;
  final String subtitle;
  final String path;
  final bool isTask;
}

class _Section {
  const _Section(this.title, this.entries);

  final String title;
  final List<_Entry> entries;
}

const _sections = [
  _Section('1. Basics', [
    _Entry('Widget', 'StatelessWidget, build, hot reload', '/basics/widgets'),
    _Entry('Task 1', 'Change the text and add a second widget', '/tasks/1', isTask: true),
    _Entry('State', 'StatefulWidget, setState', '/basics/stateful'),
    _Entry('Task 2', 'The like button does nothing', '/tasks/2', isTask: true),
    _Entry('Layout', 'Column, Row, Expanded, Padding', '/basics/layout'),
    _Entry('List', 'ListView.builder', '/basics/list'),
    _Entry('Task 3', 'Only 3 of 30 posts are shown', '/tasks/3', isTask: true),
    _Entry('Theme', 'ThemeData, Theme.of(context)', '/basics/theme'),
  ]),
  _Section('2. GoRouter', [
    _Entry('Navigation', 'Routes, go vs push', '/routing/navigation'),
    _Entry('Path parameter', '/routing/items/:id', '/routing/items/1'),
    _Entry('Task 4', 'Tapping a post does nothing', '/tasks/4', isTask: true),
  ]),
  _Section('3. Data', [
    _Entry('Model', 'freezed: copyWith, ==, fromJson', '/data/model'),
    _Entry('Task 5', 'The model loses a field', '/tasks/5', isTask: true),
    _Entry('API', 'Retrofit', '/data/api'),
    _Entry('Repository', 'A layer over the API, error handling', '/data/repository'),
  ]),
  _Section('4. State', [
    _Entry('Bloc', 'Events, states, BlocBuilder, BlocListener', '/state/bloc'),
    _Entry('Task 6', 'The state never changes', '/tasks/6', isTask: true),
    _Entry('Task 7', 'The failure screen is blank', '/tasks/7', isTask: true),
    _Entry('Cubit', 'The same without events', '/state/cubit'),
  ]),
];

/// The workshop's table of contents. Every entry is a separate GoRouter route.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Workshop'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: _sections.length,
        itemBuilder: (context, index) => _SectionView(_sections[index]),
      ),
    );
  }
}

class _SectionView extends StatelessWidget {
  const _SectionView(this.section);

  final _Section section;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
          child: Text(section.title, style: theme.textTheme.titleLarge),
        ),
        for (final entry in section.entries)
          ListTile(
            leading: Icon(
              entry.isTask ? Icons.edit_note : Icons.play_circle_outline,
              color: entry.isTask ? theme.colorScheme.tertiary : null,
            ),
            title: Text(entry.title),
            subtitle: Text(entry.subtitle),
            tileColor: entry.isTask
                ? theme.colorScheme.tertiaryContainer.withValues(alpha: 0.4)
                : null,
            onTap: () => context.push(entry.path),
          ),
      ],
    );
  }
}
