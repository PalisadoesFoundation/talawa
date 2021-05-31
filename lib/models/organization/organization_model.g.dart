// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return Organization(
    json['apiUrl'] as String?,
    json['image'] as String?,
    json['name'] as String?,
    json['description'] as String?,
    json['isPublic'] as String?,
    json['creator'] as String?,
    (json['members'] as List<dynamic>?)
        ?.map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['admins'] as List<dynamic>?)
        ?.map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['visibleInSearch'] as bool?,
  );
}

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
    <String, dynamic>{
      'apiUrl': instance.apiUrl,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'isPublic': instance.isPublic,
      'creator': instance.creator,
      'members': instance.members?.map((e) => e.toJson()).toList(),
      'admins': instance.admins?.map((e) => e.toJson()).toList(),
      'visibleInSearch': instance.visibleInSearch,
    };
