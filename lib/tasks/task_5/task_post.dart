import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_post.freezed.dart';
part 'task_post.g.dart';

/// TASK 5 (5 min)
///
/// The server also returns a "body" field, but the model does not have it, so it is lost.
///
/// 1. Add a field to the model: required String body
/// 2. Regenerate the code in the terminal:
///      fvm dart run build_runner build
/// 3. Do a hot restart and check on the task screen whether body showed up.
@freezed
abstract class TaskPost with _$TaskPost {
  const factory TaskPost({
    required int id,
    required String title,
    // TODO(task 5): add the body field.
  }) = _TaskPost;

  factory TaskPost.fromJson(Map<String, dynamic> json) =>
      _$TaskPostFromJson(json);
}
