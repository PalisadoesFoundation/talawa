// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      json['_id'] as String?,
      json['sender'] == null
          ? null
          : ChatUser.fromJson(json['sender'] as Map<String, dynamic>),
      json['messageContent'] as String?,
      json['receiver'] == null
          ? null
          : ChatUser.fromJson(json['receiver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'sender': instance.sender?.toJson(),
      'receiver': instance.receiver?.toJson(),
      'messageContent': instance.messageContent,
    };
