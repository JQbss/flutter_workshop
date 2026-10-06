import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop/common/post_tile.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';
import 'package:flutter_workshop/data/posts_repository.dart';
import 'package:flutter_workshop/state/posts_bloc.dart';
import 'package:flutter_workshop/state/posts_event.dart';
import 'package:flutter_workshop/state/posts_state.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider creates the Bloc and exposes it to the widgets below.
    // It also closes the Bloc when the screen goes away.
    return BlocProvider(
      create: (context) => PostsBloc(context.read<PostsRepository>()),
      child: const _BlocView(),
    );
  }
}

class _BlocView extends StatelessWidget {
  const _BlocView();

  @override
  Widget build(BuildContext context) {
    return StepScaffold(
      title: 'Bloc',
      // BlocListener reacts to a state change with a one-off action
      // (SnackBar, navigation), not by rebuilding widgets.
      child: BlocListener<PostsBloc, PostsState>(
        listener: (context, state) {
          if (state is PostsFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        child: Column(
          children: [
            const _StateLabel(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton(
                  // context.read gets the Bloc without listening to it.
                  // We use it in callbacks to send an event.
                  onPressed: () =>
                      context.read<PostsBloc>().add(const PostsRequested()),
                  child: const Text('Fetch posts'),
                ),
                OutlinedButton(
                  onPressed: () => context.read<PostsBloc>().add(
                    const PostsFailureSimulated(),
                  ),
                  child: const Text('Simulate failure'),
                ),
              ],
            ),
            // BlocBuilder rebuilds its piece of UI on every new state.
            Expanded(
              child: BlocBuilder<PostsBloc, PostsState>(
                builder: (context, state) {
                  // switch over a sealed class: the compiler makes sure no state is missed.
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
                      child: Text('Something went wrong: $message'),
                    ),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StateLabel extends StatelessWidget {
  const _StateLabel();

  @override
  Widget build(BuildContext context) {
    // context.watch gets the Bloc and rebuilds this widget on every state change.
    // It may only be used in build, never in callbacks.
    final state = context.watch<PostsBloc>().state;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text('Current state: ${state.runtimeType}'),
    );
  }
}
