import 'package:flutter/material.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/group_chat_info_dialogs.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/group_chat_management_dialogs.dart';

/// Utility class that provides unified access to all group chat dialog functions.
///
/// This class serves as a facade that delegates to specialized dialog classes:
/// - GroupChatInfoDialogs: For information and basic editing
/// - GroupChatManagementDialogs: For complex management operations
class GroupChatDialogs {
  /// Shows group information dialog.
  ///
  /// **params**:
  /// * `context`: The build context
  /// * `chat`: The chat object containing group information
  ///
  /// **returns**:
  ///   None
  static void showGroupInfo(BuildContext context, Chat chat) {
    GroupChatInfoDialogs.showGroupInfo(context, chat);
  }

  /// Shows edit group dialog for admin users.
  ///
  /// **params**:
  /// * `context`: The build context
  /// * `chat`: The chat object to edit
  /// * `model`: The GroupChatViewModel instance
  /// * `chatId`: The ID of the chat
  ///
  /// **returns**:
  ///   None
  static void showEditGroupDialog(
    BuildContext context,
    Chat chat,
    GroupChatViewModel model,
    String chatId,
  ) {
    GroupChatInfoDialogs.showEditGroupDialog(context, chat, model, chatId);
  }

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
    GroupChatManagementDialogs.showAddMembersDialog(context, model, chatId);
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
    GroupChatManagementDialogs.showManageMembersDialog(
      context,
      model,
      chatId,
      chat,
      onMemberRemoved,
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
    GroupChatManagementDialogs.showDeleteGroupDialog(context, model, chatId);
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
    GroupChatManagementDialogs.showLeaveGroupDialog(
      context,
      model,
      chatId,
      chat,
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
    return GroupChatManagementDialogs.addSelectedMembers(
      selectedMembers,
      model,
      chatId,
    );
  }
}
