import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/views/base_view.dart';

/// DirectChats returns a StatelessWidget for rendering all the direct chats of the current user in the Chat List Screen.
///
/// This widget displays either an empty state when no chats are available
/// or a scrollable list of chat tiles when chats exist. It includes
/// pull-to-refresh functionality for updating the chat list.
class DirectChats extends StatelessWidget {
  /// Creates a DirectChats widget.
  const DirectChats({super.key});

  /// Handles the refresh action for the chat list.
  ///
  /// This method is called when the user pulls down to refresh the chat list.
  /// It sets the chat state to loading, triggers a refresh of the chats,
  /// and adds a small delay for better user experience.
  ///
  /// **params**:
  /// * `model`: The DirectChatViewModel instance to refresh
  ///
  /// **returns**:
  ///   None
  Future<void> onRefresh(DirectChatViewModel model) async {
    model.chatState = ChatState.loading;
    model.refreshChats();
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<DirectChatViewModel>(
      onModelReady: (model) {
        model.initialise();
      },
      builder: (context, model, child) {
        if (model.chats.isEmpty) {
          return RefreshIndicator(
            onRefresh: () => onRefresh(model),
            child: ListView(
              children: const [
                SizedBox(height: 200),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_outlined,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No chats yet',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Start a conversation by selecting a contact',
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
            itemCount: model.chats.length,
            itemBuilder: (context, index) {
              return ChatTile(
                chat: model.chats[index],
                model: model,
              );
            },
          ),
        );
      },
    );
  }
}

/// ChatTile returns a widget for a tile in the list of Direct Chats in the Chat List Screen.
///
/// This widget displays individual chat information including user avatar,
/// chat name, description, and timestamp. It handles navigation to the
/// chat message screen when tapped.
class ChatTile extends StatelessWidget {
  /// Creates a ChatTile widget.
  ///
  /// The [chat] and [model] parameters are required.
  const ChatTile({super.key, required this.chat, required this.model});

  /// The chat data model containing chat information and user details.
  final ChatListTileDataModel chat;

  /// The DirectChatViewModel instance for handling chat operations.
  final DirectChatViewModel model;

  @override
  Widget build(BuildContext context) {
    // Get the first user from the chat (the other participant)
    final user = chat.users?.isNotEmpty == true ? chat.users![0] : null;

    return ListTile(
      onTap: () => navigationService.pushScreen(
        Routes.chatMessageScreen,
        arguments: [chat.id, model],
      ),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: user?.image != null && user!.image!.isNotEmpty
            ? NetworkImage(user.image!)
            : null,
        child: user?.image == null || user!.image!.isEmpty
            ? Text(
                user?.firstName?.isNotEmpty == true
                    ? user!.firstName![0].toUpperCase()
                    : '?',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            : null,
      ),
      title: Text(
        _getDisplayName(chat),
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        chat.chat?.description ?? 'No description',
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
        ),
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

  /// Formats the given DateTime into a human-readable time string.
  ///
  /// Returns the time difference in days (e.g., "3d"), hours (e.g., "5h"),
  /// minutes (e.g., "30m"), or "now" for very recent times.
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
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'now';
    }
  }

  /// Gets the display name for the chat based on chat type and participants.
  ///
  /// For direct chats (2 users), returns the name of the other participant.
  /// For group chats, returns the chat name or "Unknown Chat" if no name is set.
  ///
  /// **params**:
  /// * `chat`: The ChatListTileDataModel containing chat information
  ///
  /// **returns**:
  /// * `String`: The display name for the chat
  String _getDisplayName(ChatListTileDataModel chat) {
    if (chat.users != null && chat.users!.length == 2) {
      // For direct chats, show the other user's name
      final currentUserId = userConfig.currentUser.id;
      final otherUser = chat.users!.firstWhere(
        (user) => user.id != currentUserId,
        orElse: () => chat.users!.first,
      );
      return '${otherUser.firstName}';
    }

    // For group chats, show the chat name
    return chat.chat?.name ?? 'Unknown Chat';
  }
}
