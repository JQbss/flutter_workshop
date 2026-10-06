import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop/common/post_tile.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';
import 'package:flutter_workshop/data/posts_repository.dart';
import 'package:flutter_workshop/state/posts_bloc.dart';
import 'package:flutter_workshop/state/posts_event.dart';
import 'package:flutter_workshop/state/posts_state.dart';

/// TASK 7
///
/// Press "Simulate failure": the screen goes blank. The user should see
/// what went wrong and have a way to try again from there.
///
/// To start, delete the marked line below and see what the compiler says.
class Task7Screen extends StatelessWidget {
  const Task7Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Task 7 uses the ready-made PostsBloc from lib/state/posts_bloc.dart.
    return BlocProvider(
      create: (context) => PostsBloc(context.read<PostsRepository>()),
      child: const StepScaffold(
        title: 'Task 7',
        solutionPath: '/tasks/7/solution',
        child: _Task7View(),
      ),
    );
  }
}

class _Task7View extends StatelessWidget {
  const _Task7View();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButton(
              onPressed: () =>
                  context.read<PostsBloc>().add(const PostsRequested()),
              child: const Text('Fetch posts'),
            ),
            OutlinedButton(
              onPressed: () =>
                  context.read<PostsBloc>().add(const PostsFailureSimulated()),
              child: const Text('Simulate failure'),
            ),
          ],
        ),
        Expanded(
          child: BlocBuilder<PostsBloc, PostsState>(
            builder: (context, state) {
              return switch (state) {
                PostsInitial() => const Center(
                  child: Text('Press "Fetch posts"'),
                ),
                PostsLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
                PostsLoaded(:final posts) => ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) => PostTile(
                    title: posts[index].title,
                    body: posts[index].body,
                  ),
                ),
                // TODO(task 7): this state shows nothing.
                PostsFailure() => const SizedBox.shrink(),
              };
            },
          ),
        ),
      ],
    );
  }
}
