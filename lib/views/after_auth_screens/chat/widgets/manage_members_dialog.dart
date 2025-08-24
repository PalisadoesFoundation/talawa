import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';

/// Dialog widget for managing group members with dynamic loading.
class ManageMembersDialog extends StatefulWidget {
  const ManageMembersDialog({
    required this.chatId,
    required this.model,
    required this.chat,
    required this.userConfig,
    required this.onMemberRemoved,
  });

  /// The ID of the group chat.
  final String chatId;

  /// The GroupChatViewModel instance.
  final GroupChatViewModel model;

  /// The current chat object.
  final Chat? chat;

  /// User configuration for getting current user details.
  final UserConfig userConfig;

  /// Callback when a member is removed.
  final VoidCallback onMemberRemoved;

  @override
  State<ManageMembersDialog> createState() => ManageMembersDialogState();
}

class ManageMembersDialogState extends State<ManageMembersDialog> {
  List<dynamic>? _members;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadMembers();
  }

  /// Load members using the fetchGroupMembers method.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _loadMembers() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final members = await widget.model.fetchGroupMembers(
        chatId: widget.chatId,
        limit: 32, // Load up to 32 members
      );

      setState(() {
        _members = members;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load members: $e';
        _isLoading = false;
      });
    }
  }

  /// Confirms member removal with validation.
  ///
  /// **params**:
  /// * `memberId`: The ID of the member to remove
  /// * `memberName`: The name of the member to remove
  ///
  /// **returns**:
  ///   None
  void _confirmRemoveMember(String memberId, String memberName) {
    // Validate if member removal is allowed
    final validation = widget.model.validateMemberRemoval(
      chatId: widget.chatId,
      memberId: memberId,
    );
    if (!(validation['isValid'] as bool)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Cannot Remove Member'),
          content: Text(validation['error'] as String),
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
        title: const Text('Remove Member'),
        content:
            Text('Are you sure you want to remove $memberName from the group?'),
        actions: [
          TextButton(
            onPressed: () => navigationService.pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              navigationService.pop(); // Close confirmation dialog

              final success = await widget.model.removeGroupMember(
                chatId: widget.chatId,
                memberId: memberId,
                chat: widget.chat!,
              );

              if (success) {
                // Refresh the members list
                await _loadMembers();
                widget.onMemberRemoved();

                navigationService.showTalawaErrorDialog(
                  "$memberName removed from group",
                  MessageType.info,
                );
              }
            },
            child: const Text('Remove', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Manage Members'),
      content: SizedBox(
        width: double.maxFinite,
        height: 400, // Fixed height for better UX
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_error!),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadMembers,
                        child: const Text('Retry'),
                      ),
                    ],
                  )
                : _members == null || _members!.isEmpty
                    ? const Center(child: Text('No members found'))
                    : ListView.builder(
                        itemCount: _members!.length,
                        itemBuilder: (context, index) {
                          final member =
                              _members![index] as Map<String, dynamic>;
                          final memberId = member['id'] as String?;
                          final memberName = member['firstName'] as String? ??
                              member['name'] as String? ??
                              'Unknown';
                          final isCreator =
                              memberId == widget.chat?.creator?.id;
                          final currentUserId =
                              widget.userConfig.currentUser.id;
                          final isSelf = memberId == currentUserId;

                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: member['image'] != null
                                  ? NetworkImage(member['image'] as String)
                                  : null,
                              child: member['image'] == null
                                  ? Text(
                                      memberName.isNotEmpty
                                          ? memberName[0].toUpperCase()
                                          : 'U',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  : null,
                            ),
                            title: Text(memberName),
                            subtitle: Text(isCreator ? 'Admin' : 'Member'),
                            trailing: (!isCreator && !isSelf)
                                ? IconButton(
                                    icon: const Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                    ),
                                    onPressed: () => _confirmRemoveMember(
                                      memberId!,
                                      memberName,
                                    ),
                                  )
                                : null,
                          );
                        },
                      ),
      ),
      actions: [
        if (_members != null && _members!.isNotEmpty)
          TextButton(
            onPressed: _loadMembers,
            child: const Text('Refresh'),
          ),
        TextButton(
          onPressed: () => navigationService.pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
