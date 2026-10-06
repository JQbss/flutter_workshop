// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solution_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SolutionPost {

 int get id; String get title; String get body;
/// Create a copy of SolutionPost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SolutionPostCopyWith<SolutionPost> get copyWith => _$SolutionPostCopyWithImpl<SolutionPost>(this as SolutionPost, _$identity);

  /// Serializes this SolutionPost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SolutionPost&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body);

@override
String toString() {
  return 'SolutionPost(id: $id, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class $SolutionPostCopyWith<$Res>  {
  factory $SolutionPostCopyWith(SolutionPost value, $Res Function(SolutionPost) _then) = _$SolutionPostCopyWithImpl;
@useResult
$Res call({
 int id, String title, String body
});




}
/// @nodoc
class _$SolutionPostCopyWithImpl<$Res>
    implements $SolutionPostCopyWith<$Res> {
  _$SolutionPostCopyWithImpl(this._self, this._then);

  final SolutionPost _self;
  final $Res Function(SolutionPost) _then;

/// Create a copy of SolutionPost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? body = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SolutionPost].
extension SolutionPostPatterns on SolutionPost {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SolutionPost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SolutionPost() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SolutionPost value)  $default,){
final _that = this;
switch (_that) {
case _SolutionPost():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SolutionPost value)?  $default,){
final _that = this;
switch (_that) {
case _SolutionPost() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SolutionPost() when $default != null:
return $default(_that.id,_that.title,_that.body);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String body)  $default,) {final _that = this;
switch (_that) {
case _SolutionPost():
return $default(_that.id,_that.title,_that.body);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String body)?  $default,) {final _that = this;
switch (_that) {
case _SolutionPost() when $default != null:
return $default(_that.id,_that.title,_that.body);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SolutionPost implements SolutionPost {
  const _SolutionPost({required this.id, required this.title, required this.body});
  factory _SolutionPost.fromJson(Map<String, dynamic> json) => _$SolutionPostFromJson(json);

@override final  int id;
@override final  String title;
@override final  String body;

/// Create a copy of SolutionPost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SolutionPostCopyWith<_SolutionPost> get copyWith => __$SolutionPostCopyWithImpl<_SolutionPost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SolutionPostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SolutionPost&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body);

@override
String toString() {
  return 'SolutionPost(id: $id, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class _$SolutionPostCopyWith<$Res> implements $SolutionPostCopyWith<$Res> {
  factory _$SolutionPostCopyWith(_SolutionPost value, $Res Function(_SolutionPost) _then) = __$SolutionPostCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String body
});




}
/// @nodoc
class __$SolutionPostCopyWithImpl<$Res>
    implements _$SolutionPostCopyWith<$Res> {
  __$SolutionPostCopyWithImpl(this._self, this._then);

  final _SolutionPost _self;
  final $Res Function(_SolutionPost) _then;

/// Create a copy of SolutionPost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,}) {
  return _then(_SolutionPost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
