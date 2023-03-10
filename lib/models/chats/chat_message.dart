// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:json_annotation/json_annotation.dart';
import 'package:talawa/models/chats/chat_user.dart';
part 'chat_message.g.dart';

@JsonSerializable(explicitToJson: true)

/// This class creates JSON code for chat message using the JsonSerializable package.

class ChatMessage {
  ChatMessage(
    this.id,
    this.sender,
    this.messageContent,
    this.receiver,
  );
  // Connect the generated [_$ChatMessageFromJson] function to the `fromJson`
  // factory.
  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  // Connect the generated [_$ChatMessageToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);

  String? id;
  ChatUser? sender;
  ChatUser? receiver;
  String? messageContent;
}
