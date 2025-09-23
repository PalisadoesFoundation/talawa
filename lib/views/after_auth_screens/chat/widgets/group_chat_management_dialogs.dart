import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/add_group_chat_members_dialog.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/manage_members_dialog.dart';

/// Utility class that provides management dialog functions for group chat operations.
///
/// This class contains static methods for:
/// - Add members dialog (admin only)
/// - Manage members dialog (admin only)
/// - Delete group dialog (admin only)
/// - Leave group dialog (non-admin only)
/// - Member addition logic
class GroupChatManagementDialogs {
  const GroupChatManagementDialogs._();

  /// Navigation service instance.
  static final navigationService = locator<NavigationService>();

  /// Shows add members dialog (admin only).
  ///
  /// **params**:
  /// * `context`: The build context
  /// * `model`: The GroupChatViewModel instance
  /// * `chatId`: The ID of the chat
  ///
  /// **returns**:
  ///   None
  static void showAddMembersDialog(
    BuildContext context,
    GroupChatViewModel model,
    String chatId,
  ) {
    // Filter out users who are already members
    final availableMembers = model.getAvailableMembers(chatId);
    if (availableMembers.isEmpty) {
      navigationService.showTalawaErrorSnackBar(
        'No available members to add',
        MessageType.warning,
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AddGroupChatMembersDialog(
        availableMembers: availableMembers,
        onMembersSelected: (selectedMembers) {
          addSelectedMembers(selectedMembers, model, chatId);
        },
      ),
    );
  }

  /// Adds selected members to the group chat.
  ///
  /// **params**:
  /// * `selectedMembers`: List of users to add to the group
  /// * `model`: The GroupChatViewModel instance
  /// * `chatId`: The ID of the chat
  ///
  /// **returns**:
  ///   None
  static Future<void> addSelectedMembers(
    List<User> selectedMembers,
    GroupChatViewModel model,
    String chatId,
  ) async {
    int successCount = 0;
    int failureCount = 0;
    int alreadyMemberCount = 0;

    for (final member in selectedMembers) {
      final result = await model.addGroupMember(
        chatId: chatId,
        userId: member.id!,
      );

      if (result) {
        successCount++;
      } else {
        // Check if user is already a member
        final chatTile = model.groupChats
            .where(
              (chat) => chat.chat?.id == chatId,
            )
            .firstOrNull;
        final chat = chatTile?.chat;
        final isAlreadyMember =
            chat?.members?.any((m) => m.id == member.id) ?? false;
        if (isAlreadyMember) {
          alreadyMemberCount++;
        } else {
          failureCount++;
        }
      }
    }

    // Show result message
    String message;
    if (successCount > 0 && failureCount == 0 && alreadyMemberCount == 0) {
      message =
          'Successfully added $successCount member${successCount > 1 ? 's' : ''}';
    } else if (successCount == 0 &&
        alreadyMemberCount > 0 &&
        failureCount == 0) {
      message = 'All selected members are already in the group';
    } else if (successCount == 0 && failureCount > 0) {
      message = 'Failed to add members';
    } else {
      message =
          'Added $successCount, failed $failureCount, already members $alreadyMemberCount';
    }

    navigationService.showTalawaErrorDialog(
      message,
      MessageType.info,
    );

    if (successCount > 0) {
      // Refresh the chat to show new members
      await model.getChatMessages(chatId);
    }
  }

  /// Shows manage members dialog (admin only).
  ///
  /// **params**:
  /// * `context`: The build context
  /// * `model`: The GroupChatViewModel instance
  /// * `chatId`: The ID of the chat
  /// * `chat`: The chat object
  /// * `onMemberRemoved`: Callback for when a member is removed
  ///
  /// **returns**:
  ///   None
  static void showManageMembersDialog(
    BuildContext context,
    GroupChatViewModel model,
    String chatId,
    Chat chat,
    VoidCallback onMemberRemoved,
  ) {
    showDialog(
      context: context,
      builder: (context) => ManageMembersDialog(
        chatId: chatId,
        model: model,
        chat: chat,
        userConfig: locator<UserConfig>(),
        onMemberRemoved: onMemberRemoved,
      ),
    );
  }

  /// Shows delete group confirmation dialog (admin only).
  ///
  /// **params**:
  /// * `context`: The build context
  /// * `model`: The GroupChatViewModel instance
  /// * `chatId`: The ID of the chat
  ///
  /// **returns**:
  ///   None
  static void showDeleteGroupDialog(
    BuildContext context,
    GroupChatViewModel model,
    String chatId,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:
            Text(AppLocalizations.of(context)!.strictTranslate('Delete Group')),
        content: Text(
          AppLocalizations.of(context)!.strictTranslate(
            'Are you sure you want to delete this group? This action cannot be undone.',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child:
                Text(AppLocalizations.of(context)!.strictTranslate('Cancel')),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();

              final success = await model.deleteGroupChat(chatId);

              if (success) {
                navigationService.showTalawaErrorSnackBar(
                  'Group deleted successfully',
                  MessageType.info,
                );
                navigationService.pop(); // Go back to chat list
              } else {
                navigationService.showTalawaErrorSnackBar(
                  'Failed to delete group',
                  MessageType.error,
                );
              }
            },
            child:
                Text(AppLocalizations.of(context)!.strictTranslate('Delete')),
          ),
        ],
      ),
    );
  }

  /// Shows leave group confirmation dialog (non-admin only).
  ///
  /// **params**:
  /// * `context`: The build context
  /// * `model`: The GroupChatViewModel instance
  /// * `chatId`: The ID of the chat
  /// * `chat`: The chat object for validation
  ///
  /// **returns**:
  ///   None
  static void showLeaveGroupDialog(
    BuildContext context,
    GroupChatViewModel model,
    String chatId,
    Chat chat,
  ) {
    // Check if leaving would make the group too small
    final memberCount = chat.members?.length ?? 0;
    if (memberCount <= 3) {
      navigationService.showTalawaErrorDialog(
        'Cannot Leave Group',
        MessageType.error,
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:
            Text(AppLocalizations.of(context)!.strictTranslate('Leave Group')),
        content: Text(
          AppLocalizations.of(context)!.strictTranslate(
            'Are you sure you want to leave this group? You will need to be re-added by an admin to rejoin.',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child:
                Text(AppLocalizations.of(context)!.strictTranslate('Cancel')),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();

              final success = await model.leaveGroupChat(chatId, chat);

              if (success) {
                navigationService.showTalawaErrorSnackBar(
                  'Left group successfully',
                  MessageType.info,
                );
                navigationService.pop(); // Go back to chat list
              } else {
                navigationService.showTalawaErrorSnackBar(
                  'Failed to leave group',
                  MessageType.error,
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: Text(AppLocalizations.of(context)!.strictTranslate('Leave')),
          ),
        ],
      ),
    );
  }
}
