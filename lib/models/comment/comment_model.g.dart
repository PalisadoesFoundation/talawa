// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    json['text'] as String?,
    json['createdAt'] as String?,
    json['creator'] == null
        ? null
        : User.fromJson(json['creator'] as Map<String, dynamic>),
    json['post'] as String?,
    json['likeCount'] as String?,
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'text': instance.text,
      'createdAt': instance.createdAt,
      'creator': instance.creator?.toJson(),
      'post': instance.post,
      'likeCount': instance.likeCount,
    };
