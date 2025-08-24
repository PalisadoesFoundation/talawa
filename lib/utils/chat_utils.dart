import 'package:talawa/models/chats/chat.dart';

/// Utility class for chat-related helper methods.
///
/// This class provides static methods for:
/// - Chat type detection (group vs direct)
/// - Group name formatting and extraction
/// - Chat categorization logic
class ChatUtils {
  /// Determines if a chat is a group chat (3 or more members).
  ///
  /// **params**:
  /// * `chat`: The chat to check
  ///
  /// **returns**:
  /// * `bool`: True if the chat is a group chat, false otherwise
  static bool isGroupChat(Chat chat) {
    return (chat.members?.length ?? 0) >= 3;
  }

  /// Determines if a chat is a direct chat (exactly 2 members).
  ///
  /// **params**:
  /// * `chat`: The chat to check
  ///
  /// **returns**:
  /// * `bool`: True if the chat is a direct chat, false otherwise
  static bool isDirectChat(Chat chat) {
    return (chat.members?.length ?? 0) == 2;
  }

  /// Extracts the group name by removing the chatId suffix.
  ///
  /// Group chats may have their chatId appended as a suffix to ensure uniqueness.
  /// This method removes that suffix to get the user-friendly name.
  ///
  /// **params**:
  /// * `chatName`: The full chat name that may include chatId suffix
  ///
  /// **returns**:
  /// * `String`: The group name without the chatId suffix
  static String extractGroupName(String chatName) {
    // Check if the name ends with a pattern like "_chatId123" or "_chat0198864e-a551-7189-803e-0374aeee6650"
    final RegExp chatIdPattern = RegExp(r'_chat[A-Za-z0-9\-]+$');

    if (chatIdPattern.hasMatch(chatName)) {
      // Remove the chatId suffix
      return chatName.replaceFirst(chatIdPattern, '');
    }

    // If no suffix found, return the original name
    return chatName;
  }

  /// Formats a group name by appending the chatId suffix for uniqueness.
  ///
  /// This ensures that group names are unique by appending the chat ID.
  /// Format: "UserInputName_chatId"
  ///
  /// **params**:
  /// * `userInput`: The user's desired group name
  /// * `chatId`: The unique chat ID
  ///
  /// **returns**:
  /// * `String`: The formatted group name with chatId suffix
  static String formatGroupName(String userInput, String chatId) {
    // Clean the user input (remove any existing suffix)
    final cleanInput = extractGroupName(userInput.trim());

    // Append the chatId suffix
    return '${cleanInput}_chat$chatId';
  }

  /// Gets the display name for a chat based on its type.
  ///
  /// For group chats, extracts the clean name without chatId suffix.
  /// For direct chats, creates a name from member names.
  ///
  /// **params**:
  /// * `chat`: The chat to get the display name for
  /// * `currentUserId`: The ID of the current user (to exclude from direct chat names)
  ///
  /// **returns**:
  /// * `String`: The appropriate display name for the chat
  static String getDisplayName(Chat chat, String currentUserId) {
    if (isGroupChat(chat)) {
      // For group chats, extract the clean name
      if (chat.name != null && chat.name!.isNotEmpty) {
        return extractGroupName(chat.name!);
      }
      return 'Group Chat';
    } else if (isDirectChat(chat)) {
      // For direct chats, use the other person's name
      final otherMember = chat.members
          ?.where((member) => member.id != currentUserId)
          .firstOrNull;

      if (otherMember != null) {
        final firstName = otherMember.firstName ?? '';
        if (firstName.isNotEmpty) {
          return firstName;
        }
        return 'Unknown User';
      }
      return 'Direct Chat';
    } else {
      return 'Chat';
    }
  }

  /// Categorizes chats into groups and direct chats.
  ///
  /// **params**:
  /// * `chats`: List of all chats to categorize
  ///
  /// **returns**:
  /// * `Map<String, List<Chat>>`: Map with 'groups' and 'direct' keys containing categorized chats
  static Map<String, List<Chat>> categorizeChats(List<Chat> chats) {
    final Map<String, List<Chat>> categorized = {
      'groups': <Chat>[],
      'direct': <Chat>[],
    };

    for (final chat in chats) {
      if (isGroupChat(chat)) {
        categorized['groups']!.add(chat);
      } else if (isDirectChat(chat)) {
        categorized['direct']!.add(chat);
      }
      // Chats with 1 member or 0 members are ignored (invalid states)
    }

    return categorized;
  }

  /// Checks if the current user is the admin (creator) of a group chat.
  ///
  /// **params**:
  /// * `chat`: The chat to check
  /// * `currentUserId`: The ID of the current user
  ///
  /// **returns**:
  /// * `bool`: True if the current user is the admin, false otherwise
  static bool isCurrentUserAdmin(Chat chat, String currentUserId) {
    // For group chats, the creator is the admin
    if (!isGroupChat(chat)) {
      return false; // Direct chats don't have admins
    }

    // Check if the current user is the creator
    return chat.creator?.id == currentUserId;
  }

  /// Validates if a chat name is appropriate for a group.
  ///
  /// **params**:
  /// * `name`: The proposed chat name
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: Map with 'isValid' boolean and 'error' string if invalid
  static Map<String, dynamic> validateGroupName(String name) {
    final trimmedName = name.trim();

    if (trimmedName.isEmpty) {
      return {'isValid': false, 'error': 'Group name cannot be empty'};
    }

    if (trimmedName.length > 50) {
      return {
        'isValid': false,
        'error': 'Group name cannot exceed 50 characters',
      };
    }

    if (trimmedName.length < 2) {
      return {
        'isValid': false,
        'error': 'Group name must be at least 2 characters',
      };
    }

    // Check for invalid characters (optional)
    final RegExp invalidChars = RegExp(r'[<>:"/\\|?*]');
    if (invalidChars.hasMatch(trimmedName)) {
      return {
        'isValid': false,
        'error': 'Group name contains invalid characters',
      };
    }

    return {'isValid': true, 'error': null};
  }

  /// Validates if a member can be removed from a group chat.
  ///
  /// **params**:
  /// * `chat`: The chat to validate
  /// * `memberId`: The ID of the member to remove
  /// * `currentUserId`: The ID of the current user
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: Map with 'isValid' boolean and 'error' string if invalid
  static Map<String, dynamic> validateMemberRemoval({
    required Chat chat,
    required String memberId,
    required String currentUserId,
  }) {
    // Check if it's a group chat
    if (!isGroupChat(chat)) {
      return {
        'isValid': false,
        'error': 'Only group chats allow member removal',
      };
    }

    // Check if current user is admin
    if (!isCurrentUserAdmin(chat, currentUserId)) {
      return {'isValid': false, 'error': 'Only admin can remove members'};
    }

    // Check if trying to remove self (admin should use delete group instead)
    if (memberId == currentUserId) {
      return {
        'isValid': false,
        'error': 'Admin cannot leave group. Delete the group instead.',
      };
    }

    // Check if removal would result in less than 3 members
    final currentMemberCount = chat.members?.length ?? 0;
    if (currentMemberCount <= 3) {
      return {
        'isValid': false,
        'error': 'Cannot remove member. Group must have at least 3 members.',
      };
    }

    return {'isValid': true, 'error': null};
  }

  /// Validates if a user can leave a group chat.
  ///
  /// **params**:
  /// * `chat`: The chat to validate
  /// * `currentUserId`: The ID of the current user
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: Map with 'isValid' boolean and 'error' string if invalid
  static Map<String, dynamic> validateGroupLeave({
    required Chat chat,
    required String currentUserId,
  }) {
    // Check if it's a group chat
    if (!isGroupChat(chat)) {
      return {'isValid': false, 'error': 'Only group chats can be left'};
    }

    // Check if user is admin
    if (isCurrentUserAdmin(chat, currentUserId)) {
      return {
        'isValid': false,
        'error': 'Admin cannot leave group. Delete the group instead.',
      };
    }

    // Check if leaving would result in less than 3 members
    final currentMemberCount = chat.members?.length ?? 0;
    if (currentMemberCount <= 3) {
      return {
        'isValid': false,
        'error': 'Cannot leave group. Group must have at least 3 members.',
      };
    }

    return {'isValid': true, 'error': null};
  }

  /// Gets the member count for display purposes.
  ///
  /// **params**:
  /// * `chat`: The chat to get member count for
  ///
  /// **returns**:
  /// * `int`: The number of members in the chat
  static int getMemberCount(Chat chat) {
    return chat.members?.length ?? 0;
  }

  /// Checks if a user can perform admin actions on a chat.
  ///
  /// **params**:
  /// * `chat`: The chat to check
  /// * `currentUserId`: The ID of the current user
  /// * `action`: The action to validate ('rename', 'add_member', 'remove_member', 'delete')
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: Map with 'isValid' boolean and 'error' string if invalid
  static Map<String, dynamic> validateAdminAction({
    required Chat chat,
    required String currentUserId,
    required String action,
  }) {
    // Check if it's a group chat
    if (!isGroupChat(chat)) {
      return {
        'isValid': false,
        'error': 'Action only available for group chats',
      };
    }

    // Check if current user is admin
    if (!isCurrentUserAdmin(chat, currentUserId)) {
      return {'isValid': false, 'error': 'Only admin can perform this action'};
    }

    // Additional validation based on action type
    switch (action) {
      case 'remove_member':
        final currentMemberCount = chat.members?.length ?? 0;
        if (currentMemberCount <= 3) {
          return {
            'isValid': false,
            'error':
                'Cannot remove members. Group must have at least 3 members.',
          };
        }
        break;
      case 'rename':
      case 'add_member':
      case 'delete':
        // These actions are always valid for admins
        break;
      default:
        return {'isValid': false, 'error': 'Unknown action'};
    }

    return {'isValid': true, 'error': null};
  }
}
