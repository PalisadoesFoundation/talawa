import 'package:talawa/models/chats/chat_user.dart';

/// Represents the role of a user within a chat.
enum ChatMembershipRole {
  /// Administrator role with full permissions.
  administrator,

  /// Regular member with basic permissions.
  regular,
}

/// Extension to convert string to ChatMembershipRole enum.
extension ChatMembershipRoleExtension on String {
  /// Converts a string to ChatMembershipRole enum.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `ChatMembershipRole?`: The corresponding enum value or null if not found
  ChatMembershipRole? toChatMembershipRole() {
    switch (toLowerCase()) {
      case 'administrator':
        return ChatMembershipRole.administrator;
      case 'regular':
        return ChatMembershipRole.regular;
      default:
        return null;
    }
  }
}

/// The `ChatMember` class represents a member of a chat with their role.
///
/// This class wraps a `ChatUser` and adds role information to represent
/// the new API schema where chat members have roles.
class ChatMember {
  /// Constructs a `ChatMember` instance.
  ///
  /// [user] is the user who is a member of the chat.
  /// [role] is the role of the user in the chat.
  ChatMember({
    required this.user,
    this.role,
  });

  /// Creates a `ChatMember` instance from a JSON object.
  ///
  /// The [json] parameter is a map containing the chat member data from the API.
  /// It expects a nested 'user' object and an optional 'role' field.
  ///
  /// **params**:
  /// * `json`: JSON data from API containing chat member information
  ///
  /// **returns**:
  /// * `ChatMember`: Parsed chat member instance
  factory ChatMember.fromJson(Map<String, dynamic> json) {
    // Parse the nested user object
    final userData = json['user'] as Map<String, dynamic>?;
    final user = userData != null
        ? ChatUser.fromJson(userData)
        : ChatUser(); // Default empty user if null

    // Parse the role if it exists
    ChatMembershipRole? role;
    if (json['role'] != null) {
      final roleString = json['role'] as String;
      role = roleString.toChatMembershipRole();
    }

    return ChatMember(
      user: user,
      role: role,
    );
  }

  /// Converts the `ChatMember` instance to a JSON object.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: JSON representation of the chat member
  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'role': role?.name,
    };
  }

  /// The user who is a member of the chat.
  final ChatUser user;

  /// The role of the user in the chat.
  final ChatMembershipRole? role;
}
