import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';
import 'package:flutter_workshop/data/posts_repository.dart';
import 'package:flutter_workshop/state/posts_event.dart';
import 'package:flutter_workshop/state/posts_state.dart';
import 'package:flutter_workshop/tasks/task_6/task_6_bloc.dart';
import 'package:flutter_workshop/tasks/task_6/task_6_view.dart';

/// The screen for task 6. The task itself is done in task_6_bloc.dart.
class Task6Screen extends StatelessWidget {
  const Task6Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Task6Bloc(context.read<PostsRepository>()),
      child: StepScaffold(
        title: 'Task 6',
        solutionPath: '/tasks/6/solution',
        child: BlocBuilder<Task6Bloc, PostsState>(
          builder: (context, state) => Task6View(
            state: state,
            onRequested: () =>
                context.read<Task6Bloc>().add(const PostsRequested()),
          ),
        ),
      ),
    );
  }
}
