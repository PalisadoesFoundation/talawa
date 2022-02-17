import 'package:json_annotation/json_annotation.dart';
import 'package:talawa/models/chats/chat_user.dart';
part 'chat_message.g.dart';

@JsonSerializable()
class ChatMessage {
  ChatMessage(
<<<<<<< HEAD
    this.id,
    this.sender,
    this.receiver,
    this.messageContent,
=======
    this.messageID,
    this.sender,
    this.text,
    this.sendTime,
    // ignore: avoid_positional_boolean_parameters
    this.readByReciever,
>>>>>>> bdde5ab7900bc7023931f4421373e0e8b0645831
  );

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);

  String id;
  ChatUser? sender;
  ChatUser? receiver;
  String? messageContent;
}
