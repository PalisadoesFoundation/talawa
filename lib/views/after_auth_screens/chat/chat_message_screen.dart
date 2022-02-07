import 'package:flutter/material.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_input_field.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_message_bubble.dart';

class ChatMessageScreen extends StatelessWidget {
  const ChatMessageScreen({Key? key, required this.chat}) : super(key: key);

  final ChatListTileDataModel chat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(width: SizeConfig.safeBlockHorizontal! * 3),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: SizeConfig.blockSizeVertical! * 2.3,
            ),
            SizedBox(width: SizeConfig.safeBlockHorizontal! * 3),
            Text(chat.sender!.firstName!),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal! * 3,
              ),
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) =>
                    Message(message: chat.lastMessage!),
              ),
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }
}
