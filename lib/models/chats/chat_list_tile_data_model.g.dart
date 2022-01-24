// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_tile_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatListTileDataModel _$ChatListTileDataModelFromJson(
  Map<String, dynamic> json,
) {
  return ChatListTileDataModel(
    json['sender'] == null
        ? null
        : ChatUser.fromJson(json['sender'] as Map<String, dynamic>),
    json['lastMessage'] == null
        ? null
        : ChatMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
    json['unreadCount'] as int?,
  );
}

Map<String, dynamic> _$ChatListTileDataModelToJson(
  ChatListTileDataModel instance,
) =>
    <String, dynamic>{
      'sender': instance.sender,
      'lastMessage': instance.lastMessage,
      'unreadCount': instance.unreadCount,
    };
