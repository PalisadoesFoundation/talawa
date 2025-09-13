import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/group_chat_dialogs.dart';

/// GroupChatAppBar is a specialized app bar for group chat screens.
///
/// This widget provides:
/// - Group chat title and member count
/// - Admin and non-admin specific actions
/// - Navigation back functionality
class GroupChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a GroupChatAppBar widget.
  const GroupChatAppBar({
    super.key,
    required this.chatId,
    required this.model,
    required this.groupChatName,
    required this.memberCount,
    required this.isCurrentUserAdmin,
    required this.currentChat,
  });

  /// The ID of the group chat.
  final String chatId;

  /// The GroupChatViewModel instance.
  final GroupChatViewModel model;

  /// The display name of the group chat.
  final String groupChatName;

  /// The number of members in the group.
  final int memberCount;

  /// Whether the current user is an admin.
  final bool isCurrentUserAdmin;

  /// The current chat object.
  final Chat? currentChat;

  /// Navigation service instance.
  static final navigationService = locator<NavigationService>();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  /// Builds the group actions menu for admin features.
  ///
  /// **params**:
  /// * `context`: The build context
  ///
  /// **returns**:
  /// * `Widget`: The group actions popup menu widget
  Widget _buildGroupActions(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: (action) => _handleGroupAction(context, action),
      itemBuilder: (context) {
        final List<PopupMenuEntry<String>> items = [
          PopupMenuItem(
            value: 'info',
            child: Row(
              children: [
                const Icon(Icons.info),
                const SizedBox(width: 8),
                Text(
                  AppLocalizations.of(context)!.strictTranslate('Group Info'),
                ),
              ],
            ),
          ),
        ];

        if (isCurrentUserAdmin) {
          items.addAll([
            PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  const Icon(Icons.edit),
                  const SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(context)!.strictTranslate('Edit Group'),
                  ),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'add_members',
              child: Row(
                children: [
                  const Icon(Icons.person_add),
                  const SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(context)!
                        .strictTranslate('Add Members'),
                  ),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'manage_members',
              child: Row(
                children: [
                  const Icon(Icons.people),
                  const SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(context)!
                        .strictTranslate('Manage Members'),
                  ),
                ],
              ),
            ),
            const PopupMenuDivider(),
            PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  const Icon(Icons.delete, color: Colors.red),
                  const SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(context)!
                        .strictTranslate('Delete Group'),
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ]);
        } else {
          items.add(
            PopupMenuItem(
              value: 'leave',
              child: Row(
                children: [
                  const Icon(Icons.exit_to_app, color: Colors.orange),
                  const SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(context)!
                        .strictTranslate('Leave Group'),
                    style: const TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            ),
          );
        }

        return items;
      },
    );
  }

  /// Handles group action selection from the popup menu.
  ///
  /// **params**:
  /// * `context`: The build context
  /// * `action`: The selected action string from the popup menu
  ///
  /// **returns**:
  ///   None
  void _handleGroupAction(BuildContext context, String action) {
    final chat = currentChat;
    if (chat == null) return;

    switch (action) {
      case 'info':
        GroupChatDialogs.showGroupInfo(context, chat);
        break;
      case 'edit':
        GroupChatDialogs.showEditGroupDialog(context, chat, model, chatId);
        break;
      case 'add_members':
        GroupChatDialogs.showAddMembersDialog(
          context,
          model,
          chatId,
        );
        break;
      case 'manage_members':
        GroupChatDialogs.showManageMembersDialog(
          context,
          model,
          chatId,
          chat,
          () {
            // Refresh the chat data when a member is removed
            model.getChatMessages(chatId);
          },
        );
        break;
      case 'delete':
        GroupChatDialogs.showDeleteGroupDialog(context, model, chatId);
        break;
      case 'leave':
        GroupChatDialogs.showLeaveGroupDialog(context, model, chatId, chat);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => navigationService.pop(),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            groupChatName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$memberCount members',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      actions: [
        _buildGroupActions(context),
      ],
    );
  }
}
