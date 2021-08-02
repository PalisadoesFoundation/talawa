import 'package:json_annotation/json_annotation.dart';
import 'package:talawa/models/chats/chat_user.dart';
part 'chat_message.g.dart';

@JsonSerializable()
class ChatMessage {
  ChatMessage(this.messageID, this.sender, this.text, this.sendTime,
      this.readByReciever);

  String messageID;
  ChatUser? sender;
  String? text;
  DateTime? sendTime;
  bool? readByReciever;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}
