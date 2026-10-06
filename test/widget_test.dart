import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_workshop/app.dart';
import 'package:flutter_workshop/data/post.dart';
import 'package:flutter_workshop/data/posts_repository.dart';
import 'package:flutter_workshop/state/posts_bloc.dart';
import 'package:flutter_workshop/state/posts_event.dart';
import 'package:flutter_workshop/state/posts_state.dart';

class _FakeRepository implements PostsRepository {
  _FakeRepository({this.shouldFail = false});

  final bool shouldFail;

  @override
  Future<List<Post>> fetchPosts() async {
    if (shouldFail) throw const PostsException('No network');
    return const [Post(id: 1, userId: 1, title: 'Title', body: 'Body')];
  }

  @override
  Future<Post> fetchPost(int id) async => throw UnimplementedError();
}

void main() {
  testWidgets('App starts on the table of contents', (tester) async {
    await tester.pumpWidget(const WorkshopApp());

    expect(find.text('Flutter Workshop'), findsOneWidget);
    expect(find.text('1. Basics'), findsOneWidget);
    expect(find.text('Task 1'), findsOneWidget);
  });

  test('PostsBloc emits Loading, then Loaded', () async {
    final bloc = PostsBloc(_FakeRepository());

    final states = expectLater(
      bloc.stream,
      emitsInOrder([isA<PostsLoading>(), isA<PostsLoaded>()]),
    );
    bloc.add(const PostsRequested());

    await states;
    await bloc.close();
  });

  test('PostsBloc emits Failure when the repository throws', () async {
    final bloc = PostsBloc(_FakeRepository(shouldFail: true));

    final states = expectLater(
      bloc.stream,
      emitsInOrder([isA<PostsLoading>(), isA<PostsFailure>()]),
    );
    bloc.add(const PostsRequested());

    await states;
    await bloc.close();
  });
}
