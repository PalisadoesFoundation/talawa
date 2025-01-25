




build method - Message class - chat\_message\_bubble library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/chat/widgets/chat\_message\_bubble.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_chat_widgets_chat_message_bubble/)
3. [Message](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_chat_widgets_chat_message_bubble/Message-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

## Implementation

```
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
```

 


1. [talawa](../../index.html)
2. [chat\_message\_bubble](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_chat_widgets_chat_message_bubble/)
3. [Message](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_chat_widgets_chat_message_bubble/Message-class.html)
4. build method

##### Message class





talawa
1.0.0+1






