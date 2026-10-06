// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solution_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SolutionPost _$SolutionPostFromJson(Map<String, dynamic> json) =>
    _SolutionPost(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$SolutionPostToJson(_SolutionPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
