// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    json['description'] as String?,
    json['createdAt'] as String?,
    json['imageUrl'] as String?,
    json['videoUrl'] as String?,
    json['creator'] == null
        ? null
        : User.fromJson(json['creator'] as Map<String, dynamic>),
    json['organization'] == null
        ? null
        : Organization.fromJson(json['organization'] as Map<String, dynamic>),
    (json['likedBy'] as List<dynamic>?)
        ?.map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['comments'] as List<dynamic>?)
        ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'description': instance.description,
      'createdAt': instance.createdAt,
      'imageUrl': instance.imageUrl,
      'videoUrl': instance.videoUrl,
      'creator': instance.creator?.toJson(),
      'organization': instance.organization?.toJson(),
      'likedBy': instance.likedBy?.map((e) => e.toJson()).toList(),
      'comments': instance.comments?.map((e) => e.toJson()).toList(),
    };
