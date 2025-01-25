




getChatMessages method - DirectChatViewModel class - direct\_chat\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/chat\_view\_models/direct\_chat\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3. [DirectChatViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4. getChatMessages method

getChatMessages


dark\_mode

light\_mode




# getChatMessages method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
getChatMessages(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) chatId

)

This function get all messages for a chat.

params:

* `chatId` : id of a chat for which messages need to be fetched.

## Implementation

```
Future<void> getChatMessages(String chatId) async {
  _chatMessagesByUser.clear();
  chatState = ChatState.loading;
  // await _chatService.getMessagesFromDirectChat();
  // variable
  final List<ChatMessage> messages = [];
  _chatMessageSubscription =
      _chatService.chatMessagesStream.listen((newMessage) {
    messages.add(newMessage);
    _chatMessagesByUser[chatId] = messages;
  });
  // use `chatService` services
  await _chatService.getDirectChatMessagesByChatId(chatId);
  chatState = ChatState.complete;
  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [direct\_chat\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3. [DirectChatViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4. getChatMessages method

##### DirectChatViewModel class





talawa
1.0.0+1






