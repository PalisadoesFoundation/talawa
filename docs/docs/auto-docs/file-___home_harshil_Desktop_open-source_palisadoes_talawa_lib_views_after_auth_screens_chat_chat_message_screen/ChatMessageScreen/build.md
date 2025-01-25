




build method - ChatMessageScreen class - chat\_message\_screen library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/chat/chat\_message\_screen.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_chat_chat_message_screen/)
3. [ChatMessageScreen](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_chat_chat_message_screen/ChatMessageScreen-class.html)
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
```

 


1. [talawa](../../index.html)
2. [chat\_message\_screen](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_chat_chat_message_screen/)
3. [ChatMessageScreen](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_chat_chat_message_screen/ChatMessageScreen-class.html)
4. build method

##### ChatMessageScreen class





talawa
1.0.0+1






