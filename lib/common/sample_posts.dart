/// A hardcoded post used in the "Basics" section,
/// before we learn how to fetch real data.
class SamplePost {
  const SamplePost({required this.title, required this.body});

  final String title;
  final String body;
}

final List<SamplePost> samplePosts = List.generate(
  30,
  (index) => SamplePost(
    title: 'Post number ${index + 1}',
    body: 'This is the body of post number ${index + 1}, hardcoded in the source.',
  ),
);
