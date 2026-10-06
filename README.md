# Flutter Workshop

Projekt do 2-godzinnego warsztatu wprowadzającego we Fluttera. Aplikacja jest spisem treści: każdy krok warsztatu to osobny ekran pod własną trasą GoRoutera. Uruchamiamy ją tylko na Androidzie.

## Przed warsztatem

Zrób to wcześniej. Pierwszy build trwa kilka minut i nie chcemy tracić na niego czasu na spotkaniu.

1. Zainstaluj [FVM](https://fvm.app/documentation/getting-started/installation) oraz Android Studio (dla Android SDK i emulatora).
2. Zainstaluj VS Code z rozszerzeniem **Flutter** (`Dart-Code.flutter`). VS Code sam je zaproponuje po otwarciu projektu.
3. W katalogu projektu:

   ```sh
   fvm install          # pobiera Fluttera 3.44.9 przypiętego w .fvmrc
   fvm flutter pub get
   fvm flutter doctor   # sekcja "Android toolchain" powinna być zielona
   ```

4. Uruchom emulator Androida (albo podłącz telefon) i odpal aplikację: **F5** w VS Code lub `fvm flutter run`.
5. Jeśli widzisz ekran "Flutter Workshop" ze spisem treści, wszystko gotowe.

W trakcie warsztatu potrzebny jest internet: część ekranów pobiera dane z `https://jsonplaceholder.typicode.com`.

## Przydatne komendy

| Komenda | Do czego |
|---|---|
| `fvm flutter run` | Uruchamia aplikację. W terminalu `r` to hot reload, `R` to hot restart. |
| `fvm dart run build_runner build` | Generuje pliki `*.g.dart` i `*.freezed.dart` (potrzebne w zadaniu 5). |
| `fvm flutter analyze` | Sprawdza kod. |
| `fvm flutter test` | Uruchamia testy. |

## Agenda (120 min)

| Część | Czas | Zadania |
|---|---|---|
| Wstęp: czym jest Flutter | 15 min | |
| 1. Podstawy | 35 min | 1, 2, 3 |
| 2. GoRouter | 15 min | 4 |
| 3. Dane | 20 min | 5 |
| 4. Stan (Bloc) | 30 min | 6, 7 |
| Zapas, pytania | 5 min | |

## Kroki

Każdy wiersz to ekran w aplikacji i plik z kodem do omówienia.

| Blok | Trasa | Plik | Temat |
|---|---|---|---|
| Podstawy | `/basics/widgets` | `lib/basics/widgets_screen.dart` | `StatelessWidget`, `build`, hot reload |
| | `/basics/stateful` | `lib/basics/stateful_screen.dart` | `StatefulWidget`, `setState` |
| | `/basics/layout` | `lib/basics/layout_screen.dart` | `Column`, `Row`, `Expanded`, `Padding` |
| | `/basics/list` | `lib/basics/list_screen.dart` | `ListView.builder` |
| | `/basics/theme` | `lib/basics/theme_screen.dart` | `ThemeData`, `Theme.of(context)` |
| GoRouter | `/routing/navigation` | `lib/router/app_router.dart`, `lib/routing/navigation_screen.dart` | konfiguracja tras, `go` vs `push` |
| | `/routing/items/:id` | `lib/routing/item_screen.dart` | parametr ścieżki |
| Dane | `/data/model` | `lib/data/post.dart` | freezed: `copyWith`, `==`, `fromJson`, `part` |
| | `/data/api` | `lib/data/posts_api.dart` | Retrofit |
| | `/data/repository` | `lib/data/posts_repository.dart` | repozytorium, obsługa błędów |
| Stan | `/state/bloc` | `lib/state/posts_bloc.dart`, `lib/state/bloc_screen.dart` | sealed states, eventy, `on<Event>`, `emit`, `BlocProvider`, `BlocBuilder`, `BlocListener`, `context.read`/`watch` |
| | `/state/cubit` | `lib/state/posts_cubit.dart` | Cubit dla porównania |

## Zadania

Zadania są krótkie: jedna zmiana, od razu widoczna na ekranie. W kodzie szukaj komentarzy `TODO(zadanie N)`. Każdy ekran zadania ma w prawym górnym rogu przycisk **Rozwiązanie**, a kod rozwiązania leży w podkatalogu `solution/`.

| # | Czas | Plik | Co zrobić |
|---|---|---|---|
| 1 | 3 min | `lib/tasks/task_1/task_1_screen.dart` | Zmień tekst i kolor, dodaj drugi `Text`. |
| 2 | 4 min | `lib/tasks/task_2/task_2_screen.dart` | Zwiększaj licznik polubień w `setState`. |
| 3 | 4 min | `lib/tasks/task_3/task_3_screen.dart` | Zamień `Column` na `ListView.builder`. |
| 4 | 5 min | `lib/router/app_router.dart`, `lib/tasks/task_4/task_4_screen.dart` | Dodaj trasę `posts/:id` i przejdź do niej przez `push`. |
| 5 | 5 min | `lib/tasks/task_5/task_post.dart` | Dodaj pole `body` do modelu i uruchom `build_runner`. |
| 6 | 5 min | `lib/tasks/task_6/task_6_bloc.dart` | Uzupełnij handler: `Loading`, pobranie, `Loaded`. |
| 7 | 4 min | `lib/tasks/task_7/task_7_screen.dart` | Pokaż komunikat i przycisk ponowienia dla stanu błędu. |

Zadania są od siebie niezależne. Jeśli któregoś nie skończysz, kolejne i tak zadziała.

## Struktura projektu

```
lib/
  main.dart            punkt startowy
  app.dart             MaterialApp, motyw, RepositoryProvider
  router/              konfiguracja GoRoutera
  home/                spis treści
  common/              widgety współdzielone przez kroki
  basics/ routing/ data/ state/   gotowe przykłady do omówienia
  tasks/task_N/        zadanie N, a w solution/ jego rozwiązanie
```
