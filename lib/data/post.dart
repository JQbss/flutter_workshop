import 'package:freezed_annotation/freezed_annotation.dart';

// These two files are created by the code generator. We never edit them by hand.
// After every model change run: fvm dart run build_runner build
part 'post.freezed.dart';
part 'post.g.dart';

/// The post model. From this short declaration freezed generates
/// copyWith, ==, hashCode and toString, and json_serializable: fromJson and toJson.
@freezed
abstract class Post with _$Post {
  const factory Post({
    required int id,
    required int userId,
    required String title,
    required String body,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
