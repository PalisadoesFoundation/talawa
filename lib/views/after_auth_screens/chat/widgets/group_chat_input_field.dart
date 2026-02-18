import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';

/// GroupChatInputField returns a widget that has mutable state for group chat input.
class GroupChatInputField extends StatefulWidget {
  const GroupChatInputField({
    required this.chatId,
    required this.model,
    super.key,
  });

  /// GroupChatViewModel instance.
  final GroupChatViewModel model;

  /// ChatId.
  final String chatId;

  @override
  State<GroupChatInputField> createState() => _GroupChatInputFieldState();
}

/// _GroupChatInputFieldState is a mutable state which return a widget for Input Field in Group Chat section.
class _GroupChatInputFieldState extends State<GroupChatInputField> {
  /// TextEditingController for input field.
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
                    child: TextField(
                      key: const Key('GroupInputFieldKey'),
                      controller: controller,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffixIcon: GestureDetector(
                          key: const Key('GroupInputFieldGestureKey'),
                          onTap: () async {
                            final messageText = controller.text.trim();
                            if (messageText.isNotEmpty) {
                              try {
                                controller.clear();
                                await widget.model.sendMessageToGroupChat(
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
