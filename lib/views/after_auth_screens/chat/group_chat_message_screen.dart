import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/time_conversion.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/add_group_chat_members_dialog.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_message_bubble.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/group_chat_input_field.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/manage_members_dialog.dart';

/// GroupChatMessageScreen returns a StatefulWidget for showing group chat messages with admin features.
///
/// This screen is specifically designed for group chats (3+ members) and includes:
/// - Admin-only features (rename, add/remove members, delete group)
/// - Member management with validation
/// - Group-specific UI elements
class GroupChatMessageScreen extends StatefulWidget {
  const GroupChatMessageScreen({
    super.key,
    required this.chatId,
    required this.model,
  });

  /// chatId is the unique identifier for the group chat.
  final String chatId;

  /// The GroupChatViewModel instance that manages group chat state and messages.
  final GroupChatViewModel model;

  @override
  State<GroupChatMessageScreen> createState() => _GroupChatMessageScreenState();
}

class _GroupChatMessageScreenState extends State<GroupChatMessageScreen> {
  late ScrollController _scrollController;
  static const double _scrollThreshold = 200.0;
  Timer? _scrollDebounce;

  /// User configuration service for getting current user details.
  final _userConfig = locator<UserConfig>();

  /// Helper method to get chat state.
  ChatState get chatState => widget.model.chatState;

  /// Helper method to get messages for this chat.
  List<dynamic> get messages =>
      widget.model.chatMessagesByUser[widget.chatId] ?? [];

  /// Helper method to check if more messages can be loaded.
  bool get hasMoreMessages => widget.model.hasMoreMessages(widget.chatId);

  /// Helper method to check if currently loading more messages.
  bool get isLoadingMoreMessages =>
      widget.model.isLoadingMoreMessages(widget.chatId);

  /// Helper method to get the current chat object.
  Chat? get currentChat {
    final chatTile = widget.model.groupChats
        .where(
          (chat) => chat.chat?.id == widget.chatId,
        )
        .firstOrNull;
    return chatTile?.chat;
  }

  /// Helper method to get group chat display name.
  String get groupChatName => widget.model.getGroupDisplayName(widget.chatId);

  /// Helper method to check if current user is admin.
  bool get isCurrentUserAdmin =>
      widget.model.isCurrentUserAdminById(widget.chatId);

  /// Helper method to get member count.
  int get memberCount => widget.model.getMemberCount(widget.chatId);

  /// Helper method to load more messages.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void loadMoreMessages() {
    widget.model.loadMoreMessages(widget.chatId);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // Load chat messages when the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.model.getChatMessages(widget.chatId);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _scrollDebounce?.cancel();
    super.dispose();
  }

  /// Handle scroll events to trigger pagination when near the top of the list.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _onScroll() {
    _scrollDebounce?.cancel();
    _scrollDebounce = Timer(const Duration(milliseconds: 100), () {
      final currentMessages = messages;
      final currentChatState = chatState;

      if (currentChatState == ChatState.loading || currentMessages.isEmpty) {
        return;
      }

      if (_scrollController.position.maxScrollExtent > 0 &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - _scrollThreshold) {
        if (hasMoreMessages && !isLoadingMoreMessages) {
          loadMoreMessages();
        }
      }
    });
  }

  /// Builds the group actions menu for admin features.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Widget`: The group actions popup menu widget
  Widget _buildGroupActions() {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert, color: Colors.white),
      onSelected: _handleGroupAction,
      itemBuilder: (BuildContext context) {
        final List<PopupMenuEntry<String>> items = [];

        // Add group info option for all members
        items.add(
          const PopupMenuItem<String>(
            value: 'group_info',
            child: Row(
              children: [
                Icon(Icons.info_outline),
                SizedBox(width: 8),
                Text('Group Info'),
              ],
            ),
          ),
        );

        // Add admin-only options
        if (isCurrentUserAdmin) {
          items.addAll([
            const PopupMenuItem<String>(
              value: 'edit_group',
              child: Row(
                children: [
                  Icon(Icons.edit),
                  SizedBox(width: 8),
                  Text('Edit Group'),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'add_members',
              child: Row(
                children: [
                  Icon(Icons.person_add),
                  SizedBox(width: 8),
                  Text('Add Members'),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'manage_members',
              child: Row(
                children: [
                  Icon(Icons.people),
                  SizedBox(width: 8),
                  Text('Manage Members'),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'delete_group',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Delete Group', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ]);
        } else {
          // Non-admin options
          items.add(
            const PopupMenuItem<String>(
              value: 'leave_group',
              child: Row(
                children: [
                  Icon(Icons.exit_to_app, color: Colors.orange),
                  SizedBox(width: 8),
                  Text('Leave Group', style: TextStyle(color: Colors.orange)),
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
  /// * `action`: The selected action string from the popup menu
  ///
  /// **returns**:
  ///   None
  void _handleGroupAction(String action) {
    switch (action) {
      case 'group_info':
        _showGroupInfo();
        break;
      case 'edit_group':
        _showEditGroupDialog();
        break;
      case 'add_members':
        _showAddMembersDialog();
        break;
      case 'manage_members':
        _showManageMembersDialog();
        break;
      case 'delete_group':
        _showDeleteGroupDialog();
        break;
      case 'leave_group':
        _showLeaveGroupDialog();
        break;
    }
  }

  /// Shows group information dialog.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _showGroupInfo() {
    final chat = currentChat;
    if (chat == null) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(groupChatName),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${chat.description ?? 'No description'}'),
            const SizedBox(height: 8),
            Text('Members: $memberCount'),
            const SizedBox(height: 8),
            Text(
              'Created: ${chat.createdAt != null ? formatLocalCreated(chat.createdAt!) : 'Unavailable'}',
            ),
            const SizedBox(height: 8),
            Text('Admin: ${chat.creator?.firstName ?? 'Unknown'}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => navigationService.pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  /// Shows rename group dialog (admin only).
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _showEditGroupDialog() {
    final chat = currentChat;
    final TextEditingController nameController = TextEditingController(
      text: groupChatName,
    );
    final TextEditingController descriptionController = TextEditingController(
      text: chat?.description ?? '',
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Group'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Group Name',
                hintText: 'Enter group name',
              ),
              maxLength: 50,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Enter group description',
              ),
              maxLength: 250,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => navigationService.pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final newName = nameController.text.trim();
              final newDesc = descriptionController.text.trim();
              navigationService.pop();
              if ((newName.isNotEmpty && newName != groupChatName) ||
                  (newDesc != (chat?.description ?? ''))) {
                final success = await widget.model.updateGroupDetails(
                  chatId: widget.chatId,
                  newName: newName != groupChatName ? newName : null,
                  newDescription: newDesc != chat?.description ? newDesc : null,
                );
                if (success) {
                  setState(() {}); // Refresh UI
                }
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  /// Shows add members dialog (admin only).
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _showAddMembersDialog() {
    // Filter out users who are already members
    final availableMembers = widget.model.getAvailableMembers(widget.chatId);
    if (availableMembers.isEmpty) {
      navigationService.showTalawaErrorDialog(
        'No available members to add',
        MessageType.info,
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AddGroupChatMembersDialog(
        availableMembers: availableMembers,
        onMembersSelected: (selectedMembers) async {
          navigationService.pop();
          await _addSelectedMembers(selectedMembers);
        },
      ),
    );
  }

  /// Adds selected members to the group.
  ///
  /// **params**:
  /// * `selectedMembers`: List of users to add to the group
  ///
  /// **returns**:
  ///   None
  Future<void> _addSelectedMembers(List<User> selectedMembers) async {
    int successCount = 0;
    int failureCount = 0;
    int alreadyMemberCount = 0;

    for (final member in selectedMembers) {
      final success = await widget.model.addGroupMember(
        chatId: widget.chatId,
        userId: member.id!,
      );

      if (success) {
        successCount++;
      } else {
        // Check if the failure was due to member already being present
        final currentMembers = currentChat?.members ?? [];
        final isAlreadyMember =
            currentMembers.any((chatMember) => chatMember.id == member.id);

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
          'Successfully added $successCount member${successCount == 1 ? '' : 's'}';
    } else if (successCount == 0 &&
        alreadyMemberCount > 0 &&
        failureCount == 0) {
      message = 'All selected members are already in the group';
    } else if (successCount == 0 && failureCount > 0) {
      message = 'Failed to add members';
    } else {
      // Mixed results
      final parts = <String>[];
      if (successCount > 0) {
        parts.add('Added $successCount member${successCount == 1 ? '' : 's'}');
      }
      if (alreadyMemberCount > 0) {
        parts.add('$alreadyMemberCount already in group');
      }
      if (failureCount > 0) {
        parts.add('Failed to add $failureCount');
      }
      message = parts.join(', ');
    }

    navigationService.showTalawaErrorDialog(
      message,
      MessageType.info,
    );

    if (successCount > 0) {
      setState(() {}); // Refresh UI to show new members
    }
  }

  /// Shows manage members dialog (admin only).
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _showManageMembersDialog() {
    showDialog(
      context: context,
      builder: (context) => ManageMembersDialog(
        chatId: widget.chatId,
        model: widget.model,
        chat: currentChat,
        userConfig: _userConfig,
        onMemberRemoved: () =>
            setState(() {}), // Refresh UI after member removal
      ),
    );
  }

  /// Shows delete group confirmation dialog (admin only).
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _showDeleteGroupDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Group'),
        content: const Text(
          'Are you sure you want to delete this group? This action cannot be undone and all messages will be lost.',
        ),
        actions: [
          TextButton(
            onPressed: () => navigationService.pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              navigationService.pop();
              final success = await widget.model.deleteGroupChat(widget.chatId);
              if (success) {
                navigationService.pop(); // Return to chat list
              }
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  /// Shows leave group confirmation dialog (non-admin only).
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _showLeaveGroupDialog() {
    // Check if leaving would violate minimum member requirement
    if (memberCount <= 3) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Cannot Leave Group'),
          content: const Text(
            'Groups must have at least 3 members. You cannot leave this group. Ask the admin to delete the group instead.',
          ),
          actions: [
            TextButton(
              onPressed: () => navigationService.pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Leave Group'),
        content: const Text('Are you sure you want to leave this group?'),
        actions: [
          TextButton(
            onPressed: () => navigationService.pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              navigationService.pop();
              final currentUserId = _userConfig.currentUser.id;
              if (currentUserId != null) {
                final success = await widget.model.removeGroupMember(
                  chatId: widget.chatId,
                  memberId: currentUserId,
                  chat: currentChat!,
                );
                if (success) {
                  navigationService.pop(); // Return to chat list
                }
              }
            },
            child: const Text('Leave', style: TextStyle(color: Colors.orange)),
          ),
        ],
      ),
    );
  }

  /// Builds the chat input field.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Widget`: The chat input field widget
  Widget _buildChatInput() {
    return GroupChatInputField(
      chatId: widget.chatId,
      model: widget.model,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => navigationService.pop(),
            ),
            SizedBox(width: SizeConfig.safeBlockHorizontal! * 2),
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Icon(
                Icons.group,
                color: Colors.grey,
              ),
            ),
            SizedBox(width: SizeConfig.safeBlockHorizontal! * 3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    groupChatName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '$memberCount members',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            _buildGroupActions(),
          ],
        ),
      ),
      body: AnimatedBuilder(
        animation: widget.model,
        builder: (context, child) {
          final currentChatState = chatState;
          final currentMessages = messages;

          if (currentChatState == ChatState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              Expanded(
                child: currentMessages.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.group_outlined,
                              size: 64,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No messages yet',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Start the group conversation!',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        reverse: true,
                        itemCount: currentMessages.length,
                        itemBuilder: (context, index) {
                          final message = currentMessages[
                                  currentMessages.length - 1 - index]
                              as ChatMessage;
                          return Message(message: message);
                        },
                      ),
              ),
              _buildChatInput(),
            ],
          );
        },
      ),
    );
  }
}
