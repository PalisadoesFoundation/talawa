import 'package:talawa/models/chats/chat_user.dart';

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
  /// The [currentUserId] parameter is the ID of the current user.
  /// The [currentUserFirstName] parameter is the first name of the current user.
  /// The [currentUserImage] parameter is the image URL of the current user.
  /// The [receiverUser] parameter is an optional user who will receive the message
  /// (used for UI logic to determine message direction).
  ///
  /// **params**:
  /// * `json`: JSON data from API containing message information
  /// * `currentUserId`: The ID of the current user
  /// * `currentUserFirstName`: The first name of the current user
  /// * `currentUserImage`: The image URL of the current user
  /// * `receiverUser`: The user who will receive the message (for UI logic)
  ///
  /// **returns**:
  /// * `ChatMessage`: Parsed chat message instance
  factory ChatMessage.fromJson(
    Map<String, dynamic> json, {
    required String currentUserId,
    String? currentUserFirstName,
    String? currentUserImage,
    ChatUser? receiverUser,
  }) {
    // Get the creator of the message
    final creator = _parseCreator(json);

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
        firstName: currentUserFirstName,
        image: currentUserImage,
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

  /// Helper method to parse creator from different possible fields in JSON.
  ///
  /// Tries to parse creator from 'creator', 'sender', or 'receiver' fields
  /// in that order of preference.
  ///
  /// **params**:
  /// * `json`: JSON data from API containing message information
  ///
  /// **returns**:
  /// * `ChatUser?`: Parsed chat user or null if no valid creator found
  static ChatUser? _parseCreator(Map<String, dynamic> json) {
    // Try to parse creator from different possible fields
    final creatorFields = ['creator', 'sender', 'receiver'];

    for (final field in creatorFields) {
      if (json[field] != null && json[field] is Map<String, dynamic>) {
        final userMap = json[field] as Map<String, dynamic>;
        // Check if the map has at least one meaningful field
        if (userMap.isNotEmpty &&
            (userMap.containsKey('id') ||
                userMap.containsKey('name') ||
                userMap.containsKey('firstName'))) {
          try {
            return ChatUser.fromJson(userMap);
          } catch (e) {
            // If parsing fails, continue to next field
            continue;
          }
        }
      }
    }

    return null;
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
