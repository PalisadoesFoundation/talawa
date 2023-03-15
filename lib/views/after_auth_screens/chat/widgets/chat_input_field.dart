import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';

/// ChatInputField returns a widget that has mutable state _ChatInputFieldState.
class ChatInputField extends StatefulWidget {
  const ChatInputField({
    required this.chatId,
    required this.model,
    Key? key,
  }) : super(key: key);

  /// DirectChatViewModel instance.
  final DirectChatViewModel model;

  /// ChatId.
  final String chatId;

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

/// _ChatInputFieldState is a mutable state which return a widget for Input Field in Chat section.
class _ChatInputFieldState extends State<ChatInputField> {
  // controllers are a means to give control to the parent widget over its child state
  /// TextEditingController for input field.
  final controller = TextEditingController();

  @override
  // dispose function declaration
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return a container
    return Container(
      // styling
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal! * 2,
        vertical: SizeConfig.blockSizeVertical!,
      ),
      // input field decoration
      decoration: BoxDecoration(
        // background theme for text field
        color: Theme.of(context).scaffoldBackgroundColor,
        // box shadow
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
                    // TextField is commonly used text input widget that
                    //allows users to collect inputs from the keyboard into an app.
                    child: TextField(
                      key: const Key('InputFieldKey'),
                      controller: controller,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffixIcon: GestureDetector(
                          key: const Key('InputFieldGestureKey'),
                          onTap: () {
                            widget.model.sendMessageToDirectChat(
                              widget.chatId,
                              controller.text,
                            );
                            controller.clear();
                          },
                          child: Icon(
                            Icons.send,
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color!
                                .withOpacity(0.64),
                          ),
                        ),
                        // Placeholder text for the text field
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
