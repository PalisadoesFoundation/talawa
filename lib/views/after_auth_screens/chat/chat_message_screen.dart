// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_input_field.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_message_bubble.dart';
import 'package:talawa/views/base_view.dart';

/// ChatMessageScreen returns a StatelessWidget for showing the chat message screen.
class ChatMessageScreen extends StatelessWidget {
  const ChatMessageScreen({Key? key, required this.chatId, required this.model})
      : super(key: key);

  final String chatId;
  final DirectChatViewModel model;

  @override
  Widget build(BuildContext context) {
    model.getChatMessages(chatId);
    model.chatName(chatId);
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
            Text('${model.name}'),
          ],
        ),
      ),
      body: BaseView<DirectChatViewModel>(
        onModelReady: (model) => model.getChatMessages(chatId),
        builder: (context, model, child) =>
            (Provider.of<DirectChatViewModel>(context).chatState ==
                    ChatState.complete)
                ? Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal! * 3,
                          ),
                          child: ListView.builder(
                            itemCount: model.chatMessagesByUser[chatId]!.length,
                            itemBuilder: (context, index) {
                              return Message(
                                message:
                                    model.chatMessagesByUser[chatId]![index],
                              );
                            },
                          ),
                        ),
                      ),
                      ChatInputField(chatId: chatId, model: model),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
    );
  }
}
