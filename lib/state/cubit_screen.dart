import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop/common/post_tile.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';
import 'package:flutter_workshop/data/posts_repository.dart';
import 'package:flutter_workshop/state/posts_cubit.dart';
import 'package:flutter_workshop/state/posts_state.dart';

/// The same screen as in bloc_screen.dart, only built on a Cubit.
/// The widgets (BlocProvider, BlocBuilder) are the same, only the way of calling changes.
class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit(context.read<PostsRepository>()),
      child: const _CubitView(),
    );
  }
}

class _CubitView extends StatelessWidget {
  const _CubitView();

  @override
  Widget build(BuildContext context) {
    return StepScaffold(
      title: 'Cubit',
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton(
                // Bloc: context.read<PostsBloc>().add(const PostsRequested())
                onPressed: () => context.read<PostsCubit>().load(),
                child: const Text('Fetch posts'),
              ),
              OutlinedButton(
                onPressed: () => context.read<PostsCubit>().simulateFailure(),
                child: const Text('Simulate failure'),
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<PostsCubit, PostsState>(
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
                    child: Text('Something went wrong: $message'),
                  ),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
