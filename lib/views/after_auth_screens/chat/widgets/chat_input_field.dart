import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';

/// ChatInputField returns a widget that has mutable state _ChatInputFieldState.
class ChatInputField extends StatefulWidget {
  const ChatInputField({
    required this.chatId,
    required this.model,
    super.key,
  });

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
            color: const Color(0xFF087949).withAlpha((0.08 * 255).toInt()),
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
                          onTap: () async {
                            final messageText = controller.text.trim();
                            if (messageText.isNotEmpty) {
                              try {
                                controller.clear();
                                await widget.model.sendMessageToDirectChat(
                                  widget.chatId,
                                  messageText,
                                );
                              } catch (e) {
                                // Restore the message text if sending failed
                                controller.text = messageText;
                                // Show error snackbar

                                navigationService.showTalawaErrorDialog(
                                  'Failed to send message. Please try again.',
                                  MessageType.error,
                                );
                              }
                            }
                          },
                          child: Icon(
                            Icons.send,
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color!
                                .withAlpha((0.64 * 255).toInt()),
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
