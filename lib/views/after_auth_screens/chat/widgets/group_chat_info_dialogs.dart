import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';

/// Utility class that provides information and basic edit dialog functions for group chat.
///
/// This class contains static methods for showing:
/// - Group information dialog
/// - Edit group dialog (admin only)
class GroupChatInfoDialogs {
  /// Navigation service instance.
  static final navigationService = locator<NavigationService>();

  /// Shows group information dialog.
  ///
  /// **params**:
  /// * `context`: The build context
  /// * `chat`: The chat object containing group information
  ///
  /// **returns**:
  ///   None
  static void showGroupInfo(BuildContext context, Chat chat) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.group),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                chat.name ?? 'Group Chat',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Members: ${chat.members?.length ?? 0}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Description: ${chat.description ?? 'No description'}',
                style: const TextStyle(fontSize: 14),
              ),
              if (chat.createdAt != null) ...[
                const SizedBox(height: 8),
                Text(
                  'Created: ${chat.createdAt.toString().split(' ')[0]}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.strictTranslate('Close')),
          ),
        ],
      ),
    );
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
    final TextEditingController nameController =
        TextEditingController(text: chat.name);
    final TextEditingController descriptionController =
        TextEditingController(text: chat.description);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.edit),
            const SizedBox(width: 8),
            Text(AppLocalizations.of(context)!.strictTranslate('Edit Group')),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              key: const Key('editGroupNameField'),
              controller: nameController,
              decoration: InputDecoration(
                labelText:
                    AppLocalizations.of(context)!.strictTranslate('Group Name'),
                border: const OutlineInputBorder(),
              ),
              maxLength: 50,
            ),
            const SizedBox(height: 16),
            TextField(
              key: const Key('editGroupDescriptionField'),
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!
                    .strictTranslate('Description'),
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
              maxLength: 200,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child:
                Text(AppLocalizations.of(context)!.strictTranslate('Cancel')),
          ),
          ElevatedButton(
            onPressed: () async {
              final newName = nameController.text.trim();
              final newDescription = descriptionController.text.trim();

              if (newName.isEmpty) {
                navigationService.showTalawaErrorSnackBar(
                  'Group name cannot be empty',
                  MessageType.error,
                );
                return;
              }

              Navigator.of(context).pop();

              // Update the group
              final success = await model.updateGroupDetails(
                chatId: chatId,
                newName: newName,
                newDescription:
                    newDescription.isNotEmpty ? newDescription : null,
              );

              if (success) {
                navigationService.showTalawaErrorSnackBar(
                  'Group updated successfully',
                  MessageType.info,
                );
              } else {
                navigationService.showTalawaErrorSnackBar(
                  'Failed to update group',
                  MessageType.error,
                );
              }
            },
            child: Text(AppLocalizations.of(context)!.strictTranslate('Save')),
          ),
        ],
      ),
    );
  }
}
