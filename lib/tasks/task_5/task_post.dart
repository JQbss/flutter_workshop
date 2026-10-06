import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_post.freezed.dart';
part 'task_post.g.dart';

/// TASK 5
///
/// Compare the two blocks on the task screen: the server sends a "body",
/// but it never makes it into the object. Make it show up there.
///
/// Changing a model takes more than editing this file.
/// Need a reminder? See lib/data/post.dart.
@freezed
abstract class TaskPost with _$TaskPost {
  const factory TaskPost({
    required int id,
    required String title,
    // TODO(task 5): something the server sends is missing here.
  }) = _TaskPost;

  factory TaskPost.fromJson(Map<String, dynamic> json) =>
      _$TaskPostFromJson(json);
}
