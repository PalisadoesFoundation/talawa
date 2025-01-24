




initialise method - DirectChatViewModel class - direct\_chat\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/chat\_view\_models/direct\_chat\_view\_model.dart](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/view_model_after_auth_view_models_chat_view_models_direct_chat_view_model-library.html)
3. [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4. initialise method

initialise


dark\_mode

light\_mode




# initialise method


Future<void>
initialise()

## Implementation

```
Future<void> initialise() async {
  setState(ViewState.busy);
  chatState = ChatState.loading;

  _chatListSubscription = _chatService.chatListStream.listen((newChat) {
    _uniqueChatIds.add(newChat.id!);
    _chats.insert(0, newChat);
  });

  await _chatService.getDirectChatsByUserId();

  chatState = ChatState.complete;
  setState(ViewState.idle);
}
```

 


1. [talawa](../../index.html)
2. [direct\_chat\_view\_model](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/view_model_after_auth_view_models_chat_view_models_direct_chat_view_model-library.html)
3. [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4. initialise method

##### DirectChatViewModel class





talawa
1.0.0+1






