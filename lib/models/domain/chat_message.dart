import 'package:talawa/models/domain/chat_user.dart';

/// Clean domain model for chat messages.
///
/// Represents a message in a chat with support for replies and timestamps.
class ChatMessage {
  /// Creates a ChatMessage instance.
  const ChatMessage({
    required this.id,
    this.body,
    this.creator,
    this.chatId,
    this.parentMessage,
    this.createdAt,
    this.updatedAt,
  });

  /// Unique identifier for the message.
  final String id;

  /// The text content of the message.
  final String? body;

  /// User who created the message.
  final ChatUser? creator;

  /// ID of the chat this message belongs to.
  final String? chatId;

  /// Parent message if this is a reply.
  final ChatMessage? parentMessage;

  /// Timestamp when the message was created.
  final DateTime? createdAt;

  /// Timestamp when the message was last updated.
  final DateTime? updatedAt;

  /// Display text for the message body, with empty string fallback.
  String get displayBody => body ?? '';

  /// Whether the message has non-empty body text.
  bool get hasBody => body != null && body!.isNotEmpty;

  /// Whether this message is a reply to another message.
  bool get isReply => parentMessage != null;

  /// Human-readable time elapsed since message creation.
  String get timeAgo {
    if (createdAt == null) return '';

    final diff = DateTime.now().difference(createdAt!);
    if (diff.inSeconds < 60) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${diff.inDays ~/ 7}w ago';
  }
}
