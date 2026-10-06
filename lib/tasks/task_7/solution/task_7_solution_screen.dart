import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop/common/post_tile.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';
import 'package:flutter_workshop/data/posts_repository.dart';
import 'package:flutter_workshop/state/posts_bloc.dart';
import 'package:flutter_workshop/state/posts_event.dart';
import 'package:flutter_workshop/state/posts_state.dart';

class Task7SolutionScreen extends StatelessWidget {
  const Task7SolutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(context.read<PostsRepository>()),
      child: const StepScaffold(
        title: 'Task 7: solution',
        child: _Task7SolutionView(),
      ),
    );
  }
}

class _Task7SolutionView extends StatelessWidget {
  const _Task7SolutionView();

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
                PostsFailure(:final message) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Something went wrong: $message'),
                      const SizedBox(height: 12),
                      FilledButton(
                        onPressed: () => context.read<PostsBloc>().add(
                          const PostsRequested(),
                        ),
                        child: const Text('Try again'),
                      ),
                    ],
                  ),
                ),
              };
            },
          ),
        ),
      ],
    );
  }
}
