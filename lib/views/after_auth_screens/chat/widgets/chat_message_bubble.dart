// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/services/size_config.dart';

/// Message returns a widget for chat message in the bubble form.
class Message extends StatelessWidget {
  const Message({Key? key, required this.message}) : super(key: key);

  /// {@nodoc}
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    // styling
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 2),
      child: Row(
        mainAxisAlignment:
            message.sender!.firstName == userConfig.currentUser.firstName
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal! * 2,
              vertical: SizeConfig.blockSizeVertical! * 1.2,
            ),
            decoration: BoxDecoration(
              // if the message is sent by current user, then the background color will be white else green
              color:
                  message.sender!.firstName == userConfig.currentUser.firstName
                      ? Colors.white
                      : Colors.green,
              borderRadius:
                  message.sender!.firstName == userConfig.currentUser.firstName
                      ? const BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        )
                      : const BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
            ),
            child: Text(
              message.messageContent!,
              // if the message is sent by current user, then the text color will be black else theme bodyText color
              style: TextStyle(
                color: message.sender!.firstName ==
                        userConfig.currentUser.firstName
                    ? Colors.black
                    : Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
