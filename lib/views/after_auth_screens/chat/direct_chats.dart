import 'package:flutter/material.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/views/base_view.dart';

class DirectChats extends StatelessWidget {
  const DirectChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DirectChatViewModel>(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        model.printChats();
        return AnimatedList(
          key: model.listKey,
          initialItemCount: model.chats.length,
          itemBuilder: (context, index, animation) {
            return ChatTile(chat: model.chats[index], animation: animation);
          },
        );
      },
    );
  }
}

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key, required this.chat, required this.animation})
      : super(key: key);

  final ChatMessage chat;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axis: Axis.vertical,
      sizeFactor: animation,
      child: ListTile(
        leading: const CircleAvatar(
          radius: 25,
        ),
        title: Text(chat.sender!.firstName!),
        subtitle: Text(chat.messageContent!),
      ),
    );
  }
}
