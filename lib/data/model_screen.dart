import 'package:flutter/material.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';
import 'package:flutter_workshop/data/post.dart';

/// What we get from freezed. The model lives in post.dart.
class ModelScreen extends StatelessWidget {
  const ModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const post = Post(id: 1, userId: 7, title: 'First post', body: 'Body');

    // copyWith creates a copy with selected fields changed. The original stays untouched.
    final renamed = post.copyWith(title: 'New title');

    // Two separate objects with the same fields are equal.
    // A plain Dart class would give false here.
    const twin = Post(id: 1, userId: 7, title: 'First post', body: 'Body');

    // fromJson turns a map (decoded JSON) into an object, toJson does the reverse.
    final fromJson = Post.fromJson(const {
      'id': 2,
      'userId': 7,
      'title': 'Post from JSON',
      'body': 'Body from JSON',
    });

    return StepScaffold(
      title: 'Model',
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _Example(code: 'post.toString()', result: '$post'),
          _Example(
            code: "post.copyWith(title: 'New title')",
            result: '$renamed',
          ),
          _Example(code: 'post == twin', result: '${post == twin}'),
          _Example(code: 'post == renamed', result: '${post == renamed}'),
          _Example(code: 'Post.fromJson({...})', result: '$fromJson'),
          _Example(code: 'post.toJson()', result: '${post.toJson()}'),
        ],
      ),
    );
  }
}

class _Example extends StatelessWidget {
  const _Example({required this.code, required this.result});

  final String code;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(code, style: const TextStyle(fontFamily: 'monospace')),
        subtitle: Text(result),
      ),
    );
  }
}
