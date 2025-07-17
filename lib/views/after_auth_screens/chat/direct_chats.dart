import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/views/base_view.dart';

/// DirectChats return a statelessWidget for rendering all the direct.
///
/// chats of the current user in the Chat List Screen
class DirectChats extends StatelessWidget {
  const DirectChats({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<DirectChatViewModel>(
      onModelReady: (model) {
        model.initialise();
      },
      builder: (context, model, child) {
        if (model.chats.isEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              model.chatState = ChatState.loading;
              model.refreshChats();
              await Future.delayed(const Duration(milliseconds: 500));
            },
            child: const Center(
              child: Column(
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
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            model.chatState = ChatState.loading;
            model.refreshChats();
            await Future.delayed(const Duration(milliseconds: 500));
          },
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

/// ChatTile return a widget for a tile in the list of Direct Chats in the Chat List Screen.
class ChatTile extends StatelessWidget {
  const ChatTile({super.key, required this.chat, required this.model});

  final ChatListTileDataModel chat;
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
