import 'dart:developer';

import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/chat_service.dart';
import 'package:talawa/services/org_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// SelectContactViewModel class have different functions to interact with model.
///
/// Functions include:
/// * `getCurrentOrgUsersList` : to get all users of current organization.
/// * `createChatWithUser` : to create a new chat with selected user.
class SelectContactViewModel extends BaseModel {
  /// Organization service for accessing organization data.
  late OrganizationService _organizationService;

  /// Chat service for creating and managing chats.
  final ChatService _chatService = locator<ChatService>();

  /// User configuration service for accessing current user and organization information.
  final UserConfig userConfig = locator<UserConfig>();

  /// orgMembersList is used to store all users of current organization.
  late List<User> orgMembersList = [];

  /// This function initializes the [SelectContactViewModel] class.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialise() {
    _organizationService = locator<OrganizationService>();
  }

  /// function to get all users of current organization.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> getCurrentOrgUsersList() async {
    try {
      setState(ViewState.busy);
      if (orgMembersList.isEmpty) {
        orgMembersList = await _organizationService
            .getOrgMembersList(userConfig.currentOrg.id!);
        notifyListeners();
      }
    } catch (e) {
      // Set empty list on error
      orgMembersList = [];
    } finally {
      setState(ViewState.idle);
      notifyListeners();
    }
  }

  /// Function to create a new chat with a selected user.
  ///
  /// **params**:
  /// * `selectedUser`: The user to create a chat with.
  ///
  /// **returns**:
  /// * `Future<String?>`: The chat ID if successfully created, null otherwise.
  Future<String?> createChatWithUser(User selectedUser) async {
    try {
      setState(ViewState.busy);

      // First, check if a chat already exists with this user
      final existingChatId = await checkExistingChat(selectedUser);
      if (existingChatId != null) {
        // Chat already exists, return the existing chat ID
        return existingChatId;
      }

      // Create a unique chat name using both user IDs (sorted for consistency)
      final userIds = [userConfig.currentUser.id!, selectedUser.id!]..sort();
      final uniqueChatName = 'chat_${userIds[0]}_${userIds[1]}';

      // Create the chat
      final chat = await _chatService.createChat(
        name: uniqueChatName,
        description: 'Direct chat between users',
      );

      if (chat != null) {
        // Add both users to the chat
        final currentUserAdded = await _chatService.createChatMembership(
          chatId: chat.id!,
          userId: userConfig.currentUser.id!,
        );

        final selectedUserAdded = await _chatService.createChatMembership(
          chatId: chat.id!,
          userId: selectedUser.id!,
        );

        if (currentUserAdded && selectedUserAdded) {
          return chat.id;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      log('Error creating chat with user: $e');
      return null;
    } finally {
      setState(ViewState.idle);
    }
  }

  /// Helper method to check if a chat already exists with the given user.
  ///
  /// **params**:
  /// * `selectedUser`: The user to create a chat with.
  ///
  /// **returns**:
  /// * `Future<String?>`: The chat ID if already exists, null otherwise.
  Future<String?> checkExistingChat(User selectedUser) async {
    try {
      // Get all chats for current user
      final chats = await _chatService.getChatsByUser();

      // Find a chat that contains both the current user and the selected user
      for (final chat in chats) {
        if (chat.members != null && chat.members!.length == 2) {
          final memberIds = chat.members!
              .map((member) => member.id)
              .where((id) => id != null)
              .toList();

          final currentUserId = userConfig.currentUser.id;
          final selectedUserId = selectedUser.id;

          // Check if both users are in the chat
          if (currentUserId != null &&
              selectedUserId != null &&
              memberIds.contains(currentUserId) &&
              memberIds.contains(selectedUserId)) {
            return chat.id;
          }
        }
      }

      return null; // No existing chat found
    } catch (e) {
      log('Error checking existing chat: $e');
      return null;
    }
  }
}
