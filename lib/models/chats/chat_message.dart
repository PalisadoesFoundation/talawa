import 'package:json_annotation/json_annotation.dart';
import 'package:talawa/models/chats/chat_user.dart';
part 'chat_message.g.dart';

@JsonSerializable()
class ChatMessage {
  ChatMessage(
    this.id,
    this.sender,
    this.messageContent,
    this.receiver,
  );

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);

  String? id;
  ChatUser? sender;
  ChatUser? receiver;
  String? messageContent;
}
