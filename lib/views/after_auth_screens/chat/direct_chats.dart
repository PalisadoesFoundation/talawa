import 'package:flutter/material.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/views/base_view.dart';

class DirectChats extends StatelessWidget {
  const DirectChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DirectChatViewModel>(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return ElevatedButton(
            onPressed: () => model.getDirectChatList(), child: Text('Click'));
      },
    );
  }
}
<<<<<<< HEAD
=======

Widget chatTile(
  BuildContext context,
  ChatListTileDataModel chat,
  Animation<double> animation,
) {
  return SizeTransition(
    axis: Axis.vertical,
    sizeFactor: animation,
    child: ListTile(
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
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    ),
  );
}
>>>>>>> bdde5ab7900bc7023931f4421373e0e8b0645831
