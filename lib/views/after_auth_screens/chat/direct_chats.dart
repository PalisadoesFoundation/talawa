import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/views/base_view.dart';

class DirectChats extends StatelessWidget {
  const DirectChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DirectChatViewModel>(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => AnimatedList(
        key: const PageStorageKey("Save-Direct-Chat-Page-Position"),
        initialItemCount: model.chats!.length,
        itemBuilder: (context, index, animation) {
          final bool _isValidIncrement = model.incrementIterator();

          if (_isValidIncrement) {
            return ChatTile(
                chat: model.chatIterator!.chat!, animation: animation);
          }

          return Container();
        },
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key? key,
    required this.chat,
    required this.animation,
  }) : super(key: key);

  final ChatListTileDataModel chat;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axis: Axis.vertical,
      sizeFactor: animation,
      child: ListTile(
        onTap: () => Navigator.pushNamed(context, Routes.chatMessageScreen,
            arguments: chat),
        leading: const CircleAvatar(
          radius: 25,
        ),
        title: Text(chat.sender!.name!),
        subtitle: Text(chat.lastMessage!.text!),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "12:00 PM",
              style:
                  Theme.of(context).textTheme.caption!.copyWith(fontSize: 10.0),
            ),
            chat.unreadCount != null && chat.unreadCount! > 0
                ? CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    radius: 10,
                    child: Text(
                      chat.unreadCount!.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
