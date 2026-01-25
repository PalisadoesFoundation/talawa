import 'package:talawa/models/domain/chat_message.dart';
import 'package:talawa/models/domain/chat_user.dart';

/// Clean domain model for chats with business logic.
///
/// Represents a chat conversation with members and messages.
class Chat {
  /// Creates a Chat instance.
  const Chat({
    required this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.creator,
    this.members,
    this.messages,
  });

  /// Unique identifier for the chat.
  final String id;

  /// Optional name of the chat.
  final String? name;

  /// Optional description of the chat.
  final String? description;

  /// Timestamp when the chat was created.
  final DateTime? createdAt;

  /// Timestamp when the chat was last updated.
  final DateTime? updatedAt;

  /// User who created the chat.
  final ChatUser? creator;

  /// List of users who are members of this chat.
  final List<ChatUser>? members;

  /// List of messages in this chat.
  final List<ChatMessage>? messages;

  int get memberCount => members?.length ?? 0;
  String get displayName => name ?? 'Unnamed Chat';
  bool get hasMessages => messages?.isNotEmpty ?? false;

  ChatMessage? get lastMessage {
    if (messages == null || messages!.isEmpty) return null;
    return messages!.last;
  }
}
