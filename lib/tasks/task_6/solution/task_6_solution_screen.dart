import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop/common/step_scaffold.dart';
import 'package:flutter_workshop/data/posts_repository.dart';
import 'package:flutter_workshop/state/posts_event.dart';
import 'package:flutter_workshop/state/posts_state.dart';
import 'package:flutter_workshop/tasks/task_6/solution/task_6_solution_bloc.dart';
import 'package:flutter_workshop/tasks/task_6/task_6_view.dart';

class Task6SolutionScreen extends StatelessWidget {
  const Task6SolutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Task6SolutionBloc(context.read<PostsRepository>()),
      child: StepScaffold(
        title: 'Task 6: solution',
        child: BlocBuilder<Task6SolutionBloc, PostsState>(
          builder: (context, state) => Task6View(
            state: state,
            onRequested: () =>
                context.read<Task6SolutionBloc>().add(const PostsRequested()),
          ),
        ),
      ),
    );
  }
}
