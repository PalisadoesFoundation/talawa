// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return ChatMessage(
    json['messageID'] as String,
    json['sender'] == null
        ? null
        : ChatUser.fromJson(json['sender'] as Map<String, dynamic>),
    json['text'] as String?,
    json['sendTime'] == null
        ? null
        : DateTime.parse(json['sendTime'] as String),
    json['readByReciever'] as bool?,
  );
}

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'messageID': instance.messageID,
      'sender': instance.sender,
      'text': instance.text,
      'sendTime': instance.sendTime?.toIso8601String(),
      'readByReciever': instance.readByReciever,
    };
