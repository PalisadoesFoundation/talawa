
<div>

# getChatMessages method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
getChatMessages(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    chatId]

)



This function get all messages for a chat.

params:

-   `chatId` : id of a chat for which messages need to be fetched.



## Implementation

``` language-dart
Future<void> getChatMessages(String chatId) async {
  _chatMessagesByUser.;
  chatState = ChatState.loading;
  // await _chatService.;
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
  ;
}
```







1.  [talawa](../../index.html)
2.  [direct_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4.  getChatMessages method

##### DirectChatViewModel class







