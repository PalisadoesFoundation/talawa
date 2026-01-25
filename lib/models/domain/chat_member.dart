import 'package:talawa/models/domain/chat_user.dart';

/// Enum for chat member roles
enum ChatMemberRole {
  administrator,
  regular,
}

/// Clean domain model for chat members.
///
/// Represents a user's membership in a chat with their role.
class ChatMember {
  /// Creates a ChatMember instance.
  const ChatMember({
    required this.user,
    this.role,
  });

  /// The user who is a member of the chat.
  final ChatUser user;

  /// The role of the user in the chat (administrator or regular).
  final ChatMemberRole? role;

  // Computed properties
  bool get isAdmin => role == ChatMemberRole.administrator;
  bool get isRegular => role == ChatMemberRole.regular;
  String get displayRole => role?.name ?? 'member';
}
