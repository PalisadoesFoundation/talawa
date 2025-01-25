




sendMessageToDirectChat method - DirectChatViewModel class - direct\_chat\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/chat\_view\_models/direct\_chat\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3. [DirectChatViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4. sendMessageToDirectChat method

sendMessageToDirectChat


dark\_mode

light\_mode




# sendMessageToDirectChat method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
sendMessageToDirectChat(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) chatId,
2. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) messageContent

)

This function send the message to Direct Chat.

params:

* `chatId` : id of a chat where message need to be send.
* `messageContent` : content of a message.

## Implementation

```
Future<void> sendMessageToDirectChat(
  String chatId,
  String messageContent,
) async {
  chatState = ChatState.loading;
  _chatService.chatMessagesStream.listen((newMessage) {
    _chatMessagesByUser[chatId]!.add(newMessage);
  });
  await _chatService.sendMessageToDirectChat(chatId, messageContent);
  chatState = ChatState.complete;
}
```

 


1. [talawa](../../index.html)
2. [direct\_chat\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3. [DirectChatViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4. sendMessageToDirectChat method

##### DirectChatViewModel class





talawa
1.0.0+1






