import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';

/// The `Chat` class represents a chat in the new PostgreSQL-based chat system.
class Chat {
  /// Constructs a `Chat` instance.
  ///
  /// [id] is the unique identifier of the chat.
  /// [name] is the name/title of the chat.
  /// [description] is a description of the chat.
  /// [createdAt] is the timestamp when the chat was created.
  /// [updatedAt] is the timestamp when the chat was last updated.
  /// [members] is a list of chat members.
  /// [messages] is a list of messages in the chat.
  Chat({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.members,
    this.messages,
  });

  /// Creates a `Chat` instance from a JSON object.
  ///
  /// The [json] parameter is a map containing the chat data from the API.
  ///
  /// **params**:
  /// * `json`: JSON data from API containing chat information
  ///
  /// **returns**:
  /// * `Chat`: Parsed chat instance
  factory Chat.fromJson(Map<String, dynamic> json) {
    // Parse members if they exist
    List<ChatUser>? members;
    if (json['members'] != null) {
      final membersData = json['members'];
      if (membersData is Map<String, dynamic> && membersData['edges'] != null) {
        // Handle GraphQL paginated response format
        final edges = membersData['edges'] as List<dynamic>;
        members = edges.map((dynamic edge) {
          final edgeMap = edge as Map<String, dynamic>;
          return ChatUser.fromJson(edgeMap['node'] as Map<String, dynamic>);
        }).toList();
      } else if (membersData is List<dynamic>) {
        // Handle simple list format
        members = membersData
            .map(
              (dynamic member) =>
                  ChatUser.fromJson(member as Map<String, dynamic>),
            )
            .toList();
      }
    }

    // Parse messages if they exist (usually from paginated response)
    List<ChatMessage>? messages;
    if (json['messages'] != null) {
      final messagesData = json['messages'];
      if (messagesData is Map<String, dynamic> &&
          messagesData['edges'] != null) {
        // Handle GraphQL paginated response format
        final edges = messagesData['edges'] as List<dynamic>;
        messages = edges.map((dynamic edge) {
          final edgeMap = edge as Map<String, dynamic>;
          return ChatMessage.fromJson(edgeMap['node'] as Map<String, dynamic>);
        }).toList();
      } else if (messagesData is List<dynamic>) {
        // Handle simple list format
        messages = messagesData
            .map(
              (dynamic message) =>
                  ChatMessage.fromJson(message as Map<String, dynamic>),
            )
            .toList();
      }
    }

    final chat = Chat(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      members: members,
      messages: messages,
    );

    return chat;
  }

  /// Converts the `Chat` instance to a JSON object.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: JSON representation of the chat
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'members': members?.map((m) => m.toJson()).toList(),
      'messages': messages?.map((m) => m.toJson()).toList(),
    };
  }

  /// The unique identifier of the chat.
  String? id;

  /// The name/title of the chat.
  String? name;

  /// A description of the chat.
  String? description;

  /// The timestamp when the chat was created.
  String? createdAt;

  /// The timestamp when the chat was last updated.
  String? updatedAt;

  /// A list of chat members.
  List<ChatUser>? members;

  /// A list of messages in the chat.
  List<ChatMessage>? messages;
}
