




refreshChats method - DirectChatViewModel class - direct\_chat\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/chat\_view\_models/direct\_chat\_view\_model.dart](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/view_model_after_auth_view_models_chat_view_models_direct_chat_view_model-library.html)
3. [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4. refreshChats method

refreshChats


dark\_mode

light\_mode




# refreshChats method


void
refreshChats()

This function refresh the chats.


## Implementation

```
void refreshChats() {
  _chats.clear();
  _uniqueChatIds.clear();
  notifyListeners();
  _chatService.getDirectChatsByUserId();
}
```

 


1. [talawa](../../index.html)
2. [direct\_chat\_view\_model](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/view_model_after_auth_view_models_chat_view_models_direct_chat_view_model-library.html)
3. [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4. refreshChats method

##### DirectChatViewModel class





talawa
1.0.0+1






