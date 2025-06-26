import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/services/user_config.dart';

/// The `ChatMessage` class represents a message in the chat system.
class ChatMessage {
  /// Constructs a `ChatMessage` instance.
  ///
  /// [id] is the unique identifier of the message.
  /// [sender] is the user who sent the message.
  /// [messageContent] is the actual text content of the message.
  /// [receiver] is the user who will receive the message.
  /// [createdAt] is the timestamp when the message was created.
  /// [updatedAt] is the timestamp when the message was last updated.
  ChatMessage({
    this.id,
    this.sender,
    this.messageContent,
    this.receiver,
    this.createdAt,
    this.updatedAt,
  });

  /// Creates a `ChatMessage` instance from a JSON object.
  ///
  /// The [json] parameter is a map containing the message data from the API.
  /// The [receiverUser] parameter is an optional user who will receive the message
  /// (used for UI logic to determine message direction).
  ///
  /// **params**:
  /// * `json`: JSON data from API containing message information
  /// * `receiverUser`: The user who will receive the message (for UI logic)
  ///
  /// **returns**:
  /// * `ChatMessage`: Parsed chat message instance
  factory ChatMessage.fromJson(
    Map<String, dynamic> json, {
    ChatUser? receiverUser,
  }) {
    final userConfig = locator<UserConfig>();
    final currentUserId = userConfig.currentUser.id;

    // Get the creator of the message
    final creator = json['creator'] != null
        ? ChatUser.fromJson(json['creator'] as Map<String, dynamic>)
        : json['sender'] != null
            ? ChatUser.fromJson(json['sender'] as Map<String, dynamic>)
            : json['receiver'] != null
                ? ChatUser.fromJson(json['receiver'] as Map<String, dynamic>)
                : null;

    // Determine sender and receiver based on current user
    ChatUser? sender;
    ChatUser? receiver;

    if (creator?.id == currentUserId) {
      // Current user is the creator, so they are the sender
      sender = creator;
      receiver = receiverUser;
    } else {
      // Someone else is the creator, so they are the sender
      sender = creator;
      // Current user is the receiver (implicit)
      receiver = ChatUser(
        id: currentUserId,
        firstName: userConfig.currentUser.firstName,
        image: userConfig.currentUser.image,
      );
    }

    return ChatMessage(
      id: json['id'] as String?,
      sender: sender,
      messageContent:
          json['messageContent'] as String? ?? json['body'] as String?,
      receiver: receiver,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
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
      'sender': sender?.toJson(),
      'receiver': receiver?.toJson(),
      'messageContent': messageContent,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  /// The unique identifier of the message.
  String? id;

  /// The user who sent the message.
  ChatUser? sender;

  /// The user who will receive the message.
  ChatUser? receiver;

  /// The actual text content of the message.
  String? messageContent;

  /// The timestamp when the message was created.
  String? createdAt;

  /// The timestamp when the message was last updated.
  String? updatedAt;
}
