// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/views/base_view.dart';

/// DirectChats return a statelessWidget for rendering all the directs
/// chats of the current user in the Chat List Screen
class DirectChats extends StatelessWidget {
  const DirectChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DirectChatViewModel>(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return ListView.builder(
          // key: model.listKey,
          itemCount: model.chats.length,
          itemBuilder: (context, index) {
            return ChatTile(
              chat: model.chats[index],
              model: model,
            );
          },
        );
      },
    );
  }
}

/// ChatTile return a widget for a tile in the list of Direct Chats in the Chat List Screen.
class ChatTile extends StatelessWidget {
  const ChatTile({Key? key, required this.chat, required this.model})
      : super(key: key);

  final ChatListTileDataModel chat;
  final DirectChatViewModel model;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => navigationService
          .pushScreen(Routes.chatMessageScreen, arguments: [chat.id, model]),
      leading: const CircleAvatar(
        radius: 20,
      ),
      title: Text(chat.users![0].firstName!),
    );
  }
}
