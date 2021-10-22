/// Imported packages
import 'package:json_annotation/json_annotation.dart';
import 'package:talawa/models/chats/chat_user.dart';
part 'chat_message.g.dart';

@JsonSerializable()
class ChatMessage {
  /// Creates an ChatMessage object
  ChatMessage(
      this.messageID,
      this.sender,
      this.text,
      this.sendTime,
      // ignore: avoid_positional_boolean_parameters
      this.readByReciever);

  /// Returns a runtime instannce of a [ChatMessage]
  ///
  /// Connects the generated [_$ChatMessageToJson] function to the `fromJson` factory
  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  /// Connects the generated [_$ChatMessageToJson] function to the `toJson` method
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);

  String messageID;
  ChatUser? sender;
  String? text;
  DateTime? sendTime;
  bool? readByReciever;
}
