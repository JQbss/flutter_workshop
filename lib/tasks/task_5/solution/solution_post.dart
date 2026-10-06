import 'package:freezed_annotation/freezed_annotation.dart';

part 'solution_post.freezed.dart';
part 'solution_post.g.dart';

@freezed
abstract class SolutionPost with _$SolutionPost {
  const factory SolutionPost({
    required int id,
    required String title,
    required String body,
  }) = _SolutionPost;

  factory SolutionPost.fromJson(Map<String, dynamic> json) =>
      _$SolutionPostFromJson(json);
}
