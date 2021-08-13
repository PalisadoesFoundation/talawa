import 'package:json_annotation/json_annotation.dart';
import 'package:talawa/models/chats/chat_user.dart';
part 'chat_message.g.dart';

@JsonSerializable()
class ChatMessage {
  ChatMessage(
      this.messageID,
      this.sender,
      this.text,
      this.sendTime,
      // ignore: avoid_positional_boolean_parameters
      this.readByReciever);

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);

  String messageID;
  ChatUser? sender;
  String? text;
  DateTime? sendTime;
  bool? readByReciever;
}
