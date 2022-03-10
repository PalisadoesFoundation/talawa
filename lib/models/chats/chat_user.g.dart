// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatUser _$ChatUserFromJson(Map<String, dynamic> json) {
  return ChatUser(
    firstName: json['firstName'] as String?,
    id: json['_id'] as String?,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$ChatUserToJson(ChatUser instance) => <String, dynamic>{
      'firstName': instance.firstName,
      '_id': instance.id,
      'image': instance.image,
    };
