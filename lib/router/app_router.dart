import 'package:flutter_workshop/basics/layout_screen.dart';
import 'package:flutter_workshop/basics/list_screen.dart';
import 'package:flutter_workshop/basics/stateful_screen.dart';
import 'package:flutter_workshop/basics/theme_screen.dart';
import 'package:flutter_workshop/basics/widgets_screen.dart';
import 'package:flutter_workshop/data/api_screen.dart';
import 'package:flutter_workshop/data/model_screen.dart';
import 'package:flutter_workshop/data/repository_screen.dart';
import 'package:flutter_workshop/home/home_screen.dart';
import 'package:flutter_workshop/routing/item_screen.dart';
import 'package:flutter_workshop/routing/navigation_screen.dart';
import 'package:flutter_workshop/state/bloc_screen.dart';
import 'package:flutter_workshop/state/cubit_screen.dart';
import 'package:flutter_workshop/tasks/task_1/solution/task_1_solution_screen.dart';
import 'package:flutter_workshop/tasks/task_1/task_1_screen.dart';
import 'package:flutter_workshop/tasks/task_2/solution/task_2_solution_screen.dart';
import 'package:flutter_workshop/tasks/task_2/task_2_screen.dart';
import 'package:flutter_workshop/tasks/task_3/solution/task_3_solution_screen.dart';
import 'package:flutter_workshop/tasks/task_3/task_3_screen.dart';
import 'package:flutter_workshop/tasks/task_4/solution/task_4_solution_screen.dart';
import 'package:flutter_workshop/tasks/task_4/task_4_post_screen.dart';
import 'package:flutter_workshop/tasks/task_4/task_4_screen.dart';
import 'package:flutter_workshop/tasks/task_5/solution/task_5_solution_screen.dart';
import 'package:flutter_workshop/tasks/task_5/task_5_screen.dart';
import 'package:flutter_workshop/tasks/task_6/solution/task_6_solution_screen.dart';
import 'package:flutter_workshop/tasks/task_6/task_6_screen.dart';
import 'package:flutter_workshop/tasks/task_7/solution/task_7_solution_screen.dart';
import 'package:flutter_workshop/tasks/task_7/task_7_screen.dart';
import 'package:go_router/go_router.dart';

/// The map of the app: which path leads to which screen.
///
/// Routes are nested under '/', so every screen has the table of contents below it
/// and the back arrow always has somewhere to return to. A child path is appended
/// to the parent path: '/' + 'basics/widgets' gives '/basics/widgets'.
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        // --- 1. Basics ---
        GoRoute(
          path: 'basics/widgets',
          builder: (context, state) => const WidgetsScreen(),
        ),
        GoRoute(
          path: 'basics/stateful',
          builder: (context, state) => const StatefulScreen(),
        ),
        GoRoute(
          path: 'basics/layout',
          builder: (context, state) => const LayoutScreen(),
        ),
        GoRoute(
          path: 'basics/list',
          builder: (context, state) => const ListScreen(),
        ),
        GoRoute(
          path: 'basics/theme',
          builder: (context, state) => const ThemeScreen(),
        ),

        // --- 2. GoRouter ---
        GoRoute(
          path: 'routing/navigation',
          builder: (context, state) => const NavigationScreen(),
        ),
        GoRoute(
          // :id is a path parameter. It matches /routing/items/1, /routing/items/42 etc.
          path: 'routing/items/:id',
          builder: (context, state) {
            // Parameters arrive as text, so we convert to a number.
            final id = int.parse(state.pathParameters['id']!);
            return ItemScreen(id: id);
          },
        ),

        // --- 3. Data ---
        GoRoute(
          path: 'data/model',
          builder: (context, state) => const ModelScreen(),
        ),
        GoRoute(
          path: 'data/api',
          builder: (context, state) => const ApiScreen(),
        ),
        GoRoute(
          path: 'data/repository',
          builder: (context, state) => const RepositoryScreen(),
        ),

        // --- 4. State ---
        GoRoute(
          path: 'state/bloc',
          builder: (context, state) => const BlocScreen(),
        ),
        GoRoute(
          path: 'state/cubit',
          builder: (context, state) => const CubitScreen(),
        ),

        // --- Tasks: each has a 'solution' sub-route with the solution ---
        GoRoute(
          path: 'tasks/1',
          builder: (context, state) => const Task1Screen(),
          routes: [
            GoRoute(
              path: 'solution',
              builder: (context, state) => const Task1SolutionScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'tasks/2',
          builder: (context, state) => const Task2Screen(),
          routes: [
            GoRoute(
              path: 'solution',
              builder: (context, state) => const Task2SolutionScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'tasks/3',
          builder: (context, state) => const Task3Screen(),
          routes: [
            GoRoute(
              path: 'solution',
              builder: (context, state) => const Task3SolutionScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'tasks/4',
          builder: (context, state) => const Task4Screen(),
          routes: [
            // TODO(task 4): add a 'posts/:id' route here that opens Task4PostScreen.
            // See the solution below, or 'routing/items/:id' above, for the pattern.
            GoRoute(
              path: 'solution',
              builder: (context, state) => const Task4SolutionScreen(),
              routes: [
                GoRoute(
                  path: 'posts/:id',
                  builder: (context, state) {
                    final id = int.parse(state.pathParameters['id']!);
                    return Task4PostScreen(id: id);
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: 'tasks/5',
          builder: (context, state) => const Task5Screen(),
          routes: [
            GoRoute(
              path: 'solution',
              builder: (context, state) => const Task5SolutionScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'tasks/6',
          builder: (context, state) => const Task6Screen(),
          routes: [
            GoRoute(
              path: 'solution',
              builder: (context, state) => const Task6SolutionScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'tasks/7',
          builder: (context, state) => const Task7Screen(),
          routes: [
            GoRoute(
              path: 'solution',
              builder: (context, state) => const Task7SolutionScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
