// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_tile_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatListTileDataModel _$ChatListTileDataModelFromJson(
  Map<String, dynamic> json,
) =>
    ChatListTileDataModel(
      (json['users'] as List<dynamic>?)
          ?.map((e) => ChatUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as String?,
    );

Map<String, dynamic> _$ChatListTileDataModelToJson(
  ChatListTileDataModel instance,
) =>
    <String, dynamic>{
      'users': instance.users,
      'id': instance.id,
    };
