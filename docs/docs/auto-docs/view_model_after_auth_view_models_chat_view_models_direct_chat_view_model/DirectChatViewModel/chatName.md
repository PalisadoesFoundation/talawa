
<div>

# chatName method

</div>


void chatName(

1.  [dynamic
    chatId]

)



## Implementation

``` language-dart
void chatName(chatId) {
  final List<ChatUser> users =
      _chats.firstWhere((element) => element.id == chatId).users!;

  users.forEach((element) {
    if (element.id != userConfig.currentUser.id!) {
      name = element.firstName;
    }
  });
}
```







1.  [talawa](../../index.md)
2.  [direct_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.md)
4.  chatName method

##### DirectChatViewModel class







