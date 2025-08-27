import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/utils/chat_utils.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';
import 'package:talawa/views/base_view.dart';

/// GroupChats returns a StatelessWidget for rendering all the group chats of the current user in the Chat List Screen.
///
/// This widget displays either an empty state when no group chats are available
/// or a scrollable list of group chat tiles when group chats exist. It includes
/// pull-to-refresh functionality for updating the group chat list.
///
/// Group chats are defined as chats with 3 or more members.
class GroupChats extends StatelessWidget {
  /// Creates a GroupChats widget.
  const GroupChats({super.key});

  /// Handles the refresh action for the group chat list.
  ///
  /// This method is called when the user pulls down to refresh the group chat list.
  /// It sets the chat state to loading, triggers a refresh of the group chats,
  /// and adds a small delay for better user experience.
  ///
  /// **params**:
  /// * `model`: The GroupChatViewModel instance to refresh
  ///
  /// **returns**:
  ///   None
  Future<void> onRefresh(GroupChatViewModel model) async {
    model.chatState = ChatState.loading;
    model.refreshChats();
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<GroupChatViewModel>(
      onModelReady: (model) {
        model.initialise();
      },
      builder: (context, model, child) {
        if (model.groupChats.isEmpty) {
          return RefreshIndicator(
            onRefresh: () => onRefresh(model),
            child: ListView(
              children: const [
                SizedBox(height: 200),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.group_outlined,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No group chats yet',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Create a group to start chatting with multiple people',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Pull down to refresh',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => onRefresh(model),
          child: ListView.builder(
            itemCount: model.groupChats.length,
            itemBuilder: (context, index) {
              return GroupChatTile(
                chat: model.groupChats[index],
                model: model,
              );
            },
          ),
        );
      },
    );
  }
}

/// GroupChatTile returns a widget for a tile in the list of Group Chats in the Chat List Screen.
///
/// This widget displays individual group chat information including group avatar,
/// chat name, description, member count, and timestamp. It handles navigation to the
/// chat message screen when tapped.
class GroupChatTile extends StatelessWidget {
  /// Creates a GroupChatTile widget.
  ///
  /// The [chat] and [model] parameters are required.
  const GroupChatTile({super.key, required this.chat, required this.model});

  /// The chat data model containing chat information and member details.
  final ChatListTileDataModel chat;

  /// The GroupChatViewModel instance for handling group chat operations.
  final GroupChatViewModel model;

  @override
  Widget build(BuildContext context) {
    final chatName = getGroupChatDisplayName(chat);

    return ListTile(
      onTap: () => navigationService.pushScreen(
        Routes.groupChatMessageScreen,
        arguments: [chat.id, model],
      ),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.group,
          color: Colors.white,
          size: 30,
        ),
      ),
      title: Text(
        chatName,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            chat.chat?.description ?? 'No description',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          //TODO : Add member count display support in future
          // const SizedBox(height: 4),
          // Text(
          //   '$memberCount members',
          //   style: TextStyle(
          //     color: Colors.grey[500],
          //     fontSize: 12,
          //   ),
          // ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            chat.chat?.createdAt != null
                ? _formatTime(DateTime.parse(chat.chat!.createdAt!))
                : '',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  /// Gets the display name for a group chat.
  ///
  /// If the chat has a name, use it. Otherwise, create a name from member names.
  ///
  /// **params**:
  /// * `chat`: The ChatListTileDataModel containing chat information
  ///
  /// **returns**:
  /// * `String`: The display name for the group chat
  String getGroupChatDisplayName(ChatListTileDataModel chat) {
    // If chat has a name, use it
    if (chat.chat?.name != null && chat.chat!.name!.isNotEmpty) {
      return ChatUtils.extractGroupName(chat.chat!.name!);
    }

    // Otherwise, create a name from member names
    if (chat.users != null && chat.users!.isNotEmpty) {
      final names = chat.users!
          .take(3) // Take first 3 members
          .map((user) => user.firstName ?? 'Unknown')
          .where((name) => name.isNotEmpty)
          .toList();

      if (names.isNotEmpty) {
        if (names.length <= 2) {
          return names.join(', ');
        } else {
          return '${names.take(2).join(', ')} +${chat.users!.length - 2} others';
        }
      }
    }

    return 'Group Chat';
  }

  /// Formats the given DateTime into a human-readable time string.
  ///
  /// **params**:
  /// * `dateTime`: The DateTime to format
  ///
  /// **returns**:
  /// * `String`: Formatted time string
  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
