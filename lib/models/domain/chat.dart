import 'package:talawa/models/domain/chat_message.dart';
import 'package:talawa/models/domain/chat_user.dart';

class Chat {
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

  final String id;
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ChatUser? creator;
  final List<ChatUser>? members;
  final List<ChatMessage>? messages;

  int get memberCount => members?.length ?? 0;
  String get displayName => name ?? 'Unnamed Chat';
  bool get hasMessages => messages?.isNotEmpty ?? false;

  ChatMessage? get lastMessage {
    if (messages == null || messages!.isEmpty) return null;
    return messages!.last;
  }
}
