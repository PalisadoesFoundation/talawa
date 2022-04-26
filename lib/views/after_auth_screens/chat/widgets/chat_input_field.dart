import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({
    required this.chatId,
    required this.model,
    Key? key,
  }) : super(key: key);

  final DirectChatViewModel model;
  final String chatId;

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal! * 2,
        vertical: SizeConfig.blockSizeVertical!,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 32,
            color: const Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 3,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  SizedBox(width: SizeConfig.blockSizeHorizontal),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            widget.model.sendMessageToDirectChat(
                                widget.chatId, controller.text);
                            controller.clear();
                          },
                          child: Icon(
                            Icons.send,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(0.64),
                          ),
                        ),
                        hintText: "Type a message",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
