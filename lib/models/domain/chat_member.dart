import 'package:talawa/models/domain/chat_user.dart';

/// Enum for chat member roles
enum ChatMemberRole {
  administrator,
  regular,
}

/// Clean domain model for chat members
class ChatMember {
  const ChatMember({
    required this.user,
    this.role,
  });

  final ChatUser user;
  final ChatMemberRole? role;

  // Computed properties
  bool get isAdmin => role == ChatMemberRole.administrator;
  bool get isRegular => role == ChatMemberRole.regular;
  String get displayRole => role?.name ?? 'member';
}
