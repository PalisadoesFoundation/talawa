import 'package:talawa/models/domain/chat_user.dart';

/// Enum for chat member roles.
enum ChatMemberRole {
  /// Administrator role with elevated permissions.
  administrator,

  /// Regular member role with standard permissions.
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

  /// Whether this member is an administrator.
  bool get isAdmin => role == ChatMemberRole.administrator;

  /// Whether this member is a regular member.
  bool get isRegular => role == ChatMemberRole.regular;

  /// Display name for the member's role.
  String get displayRole => role?.name ?? 'member';
}
