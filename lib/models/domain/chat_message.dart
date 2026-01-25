import 'package:talawa/models/domain/chat_user.dart';

/// Clean domain model for chat messages
class ChatMessage {
  const ChatMessage({
    required this.id,
    this.body,
    this.creator,
    this.chatId,
    this.parentMessage,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String? body;
  final ChatUser? creator;
  final String? chatId;
  final ChatMessage? parentMessage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  // Computed properties
  String get displayBody => body ?? '';
  bool get hasBody => body != null && body!.isNotEmpty;
  bool get isReply => parentMessage != null;

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
