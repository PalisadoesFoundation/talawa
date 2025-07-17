import 'package:talawa/models/chats/chat_user.dart';

/// The `ChatMessage` class represents a message in the new PostgreSQL-based chat system.
class ChatMessage {
  /// Constructs a `ChatMessage` instance.
  ///
  /// [id] is the unique identifier of the message.
  /// [body] is the actual text content of the message.
  /// [creator] is the user who created the message.
  /// [chatId] is the ID of the chat this message belongs to.
  /// [parentMessage] is the parent message if this is a reply.
  /// [createdAt] is the timestamp when the message was created.
  /// [updatedAt] is the timestamp when the message was last updated.
  ChatMessage({
    this.id,
    this.body,
    this.creator,
    this.chatId,
    this.parentMessage,
    this.createdAt,
    this.updatedAt,
  });

  /// Creates a `ChatMessage` instance from a JSON object.
  ///
  /// The [json] parameter is a map containing the message data from the API.
  ///
  /// **params**:
  /// * `json`: JSON data from API containing message information
  ///
  /// **returns**:
  /// * `ChatMessage`: Parsed chat message instance
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    // Parse creator if it exists
    ChatUser? creator;
    if (json['creator'] != null && json['creator'] is Map<String, dynamic>) {
      creator = ChatUser.fromJson(json['creator'] as Map<String, dynamic>);
    }

    // Parse parent message if it exists
    ChatMessage? parentMessage;
    if (json['parentMessage'] != null &&
        json['parentMessage'] is Map<String, dynamic>) {
      parentMessage =
          ChatMessage.fromJson(json['parentMessage'] as Map<String, dynamic>);
    }

    // Extract chat ID from chat object or direct field
    String? chatId;
    if (json['chat'] != null && json['chat'] is Map<String, dynamic>) {
      final chatData = json['chat'] as Map<String, dynamic>;
      chatId = chatData['id'] as String?;
    } else if (json['chatId'] != null) {
      chatId = json['chatId'] as String?;
    }

    final messageId = json['id'] as String?;
    final messageBody = json['body'] as String?;

    final message = ChatMessage(
      id: messageId,
      body: messageBody,
      creator: creator,
      chatId: chatId,
      parentMessage: parentMessage,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

    return message;
  }

  /// Converts the `ChatMessage` instance to a JSON object.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: JSON representation of the chat message
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'body': body,
      'creator': creator?.toJson(),
      'chatId': chatId,
      'parentMessage': parentMessage?.toJson(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  /// The unique identifier of the message.
  String? id;

  /// The actual text content of the message.
  String? body;

  /// The user who created the message.
  ChatUser? creator;

  /// The ID of the chat this message belongs to.
  String? chatId;

  /// The parent message if this is a reply.
  ChatMessage? parentMessage;

  /// The timestamp when the message was created.
  String? createdAt;

  /// The timestamp when the message was last updated.
  String? updatedAt;
}
