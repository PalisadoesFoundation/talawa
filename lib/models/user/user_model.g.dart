// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    adminFor: (json['adminFor'] as List<dynamic>?)
        ?.map((e) => Organization.fromJson(e as Map<String, dynamic>))
        .toList(),
    createdOrganizations: (json['createdOrganizations'] as List<dynamic>?)
        ?.map((e) => Organization.fromJson(e as Map<String, dynamic>))
        .toList(),
    email: json['email'] as String?,
    firstName: json['firstName'] as String?,
    id: json['id'] as String,
    image: json['image'] as String?,
    joinedOrganizations: (json['joinedOrganizations'] as List<dynamic>?)
        ?.map((e) => Organization.fromJson(e as Map<String, dynamic>))
        .toList(),
    lastName: json['lastName'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'image': instance.image,
      'joinedOrganizations':
          instance.joinedOrganizations?.map((e) => e.toJson()).toList(),
      'createdOrganizations':
          instance.createdOrganizations?.map((e) => e.toJson()).toList(),
      'adminFor': instance.adminFor?.map((e) => e.toJson()).toList(),
    };
