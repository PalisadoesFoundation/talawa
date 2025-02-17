
<div>

# initialise method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




## Implementation

``` language-dart
Future<void>  async {
  setState(ViewState.busy);
  chatState = ChatState.loading;

  _chatListSubscription = _chatService.chatListStream.listen((newChat) {
    _uniqueChatIds.add(newChat.id!);
    _chats.insert(0, newChat);
  });

  await _chatService.;

  chatState = ChatState.complete;
  setState(ViewState.idle);
}
```







1.  [talawa](../../index.html)
2.  [direct_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4.  initialise method

##### DirectChatViewModel class







