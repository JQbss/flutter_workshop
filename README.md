# Flutter Workshop

An introductory Flutter project. The app is a table of contents: every step is a separate screen under its own GoRouter route. It targets Android only.

## Setup

1. Install [FVM](https://fvm.app/documentation/getting-started/installation) and Android Studio (for the Android SDK and the emulator).
2. Install VS Code with the **Flutter** extension (`Dart-Code.flutter`). VS Code suggests it when you open the project.
3. In the project directory:

   ```sh
   fvm install          # downloads Flutter 3.44.9 pinned in .fvmrc
   fvm flutter pub get
   fvm flutter doctor   # the "Android toolchain" section should be green
   ```

4. Start an Android emulator (or connect a phone) and run the app: **F5** in VS Code or `fvm flutter run`.

Some screens fetch data from `https://jsonplaceholder.typicode.com`, so the app needs an internet connection.

## Commands

| Command | Purpose |
|---|---|
| `fvm flutter run` | Runs the app. In the terminal `r` is hot reload, `R` is hot restart. |
| `fvm dart run build_runner build` | Generates the `*.g.dart` and `*.freezed.dart` files. |
| `fvm flutter analyze` | Analyzes the code. |
| `fvm flutter test` | Runs the tests. |

## Steps

Each row is a screen in the app and the file with the code behind it.

| Section | Route | File | Topic |
|---|---|---|---|
| Basics | `/basics/widgets` | `lib/basics/widgets_screen.dart` | `StatelessWidget`, `build`, hot reload |
| | `/basics/stateful` | `lib/basics/stateful_screen.dart` | `StatefulWidget`, `setState` |
| | `/basics/layout` | `lib/basics/layout_screen.dart` | `Column`, `Row`, `Expanded`, `Padding` |
| | `/basics/list` | `lib/basics/list_screen.dart` | `ListView.builder` |
| | `/basics/theme` | `lib/basics/theme_screen.dart` | `ThemeData`, `Theme.of(context)` |
| GoRouter | `/routing/navigation` | `lib/router/app_router.dart`, `lib/routing/navigation_screen.dart` | route configuration, `go` vs `push` |
| | `/routing/items/:id` | `lib/routing/item_screen.dart` | path parameter |
| Data | `/data/model` | `lib/data/post.dart` | freezed: `copyWith`, `==`, `fromJson`, `part` |
| | `/data/api` | `lib/data/posts_api.dart` | Retrofit |
| | `/data/repository` | `lib/data/posts_repository.dart` | repository, error handling |
| State | `/state/bloc` | `lib/state/posts_bloc.dart`, `lib/state/bloc_screen.dart` | sealed states, events, `on<Event>`, `emit`, `BlocProvider`, `BlocBuilder`, `BlocListener`, `context.read`/`watch` |
| | `/state/cubit` | `lib/state/posts_cubit.dart` | Cubit for comparison |

## Tasks

Each task is a single change that is visible on screen right away. Look for `TODO(task N)` comments in the code. Every task screen has a **Solution** button in the top right corner, and the solution code lives in the `solution/` subdirectory.

| # | File | What to do |
|---|---|---|
| 1 | `lib/tasks/task_1/task_1_screen.dart` | Change the text and color, add a second `Text`. |
| 2 | `lib/tasks/task_2/task_2_screen.dart` | Increase the like counter inside `setState`. |
| 3 | `lib/tasks/task_3/task_3_screen.dart` | Replace `Column` with `ListView.builder`. |
| 4 | `lib/router/app_router.dart`, `lib/tasks/task_4/task_4_screen.dart` | Add a `posts/:id` route and navigate to it with `push`. |
| 5 | `lib/tasks/task_5/task_post.dart` | Add a `body` field to the model and run `build_runner`. |
| 6 | `lib/tasks/task_6/task_6_bloc.dart` | Complete the handler: `Loading`, fetch, `Loaded`. |
| 7 | `lib/tasks/task_7/task_7_screen.dart` | Show a message and a retry button for the failure state. |

The tasks are independent of each other.

## Project structure

```
lib/
  main.dart            entry point
  app.dart             MaterialApp, theme, RepositoryProvider
  router/              GoRouter configuration
  home/                table of contents
  common/              widgets shared between steps
  basics/ routing/ data/ state/   ready-made examples
  tasks/task_N/        task N, with its solution in solution/
```
