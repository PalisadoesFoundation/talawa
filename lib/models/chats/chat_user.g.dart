// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatUser _$ChatUserFromJson(Map<String, dynamic> json) {
  return ChatUser(
    name: json['name'] as String?,
    id: json['id'] as String?,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$ChatUserToJson(ChatUser instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'image': instance.image,
    };
