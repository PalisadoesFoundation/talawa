



menu

1.  [talawa](../../index.md)
2.  [view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  leaveGroupChat method


leaveGroupChat


 dark_mode   light_mode 




<div>

# leaveGroupChat method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]
leaveGroupChat(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    chatId, ]
2.  [[[Chat](../../models_chats_chat/Chat-class.md)]
    chat]

)



Leaves the group chat (removes current user from the group).

**params**:

-   `chatId`: The ID of the group chat to leave
-   `chat`: The chat object for validation

**returns**:

-   `Future<bool>`: True if user left successfully, false otherwise



## Implementation

``` language-dart
Future<bool> leaveGroupChat(String chatId, Chat chat) async 
```







1.  [talawa](../../index.md)
2.  [group_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  leaveGroupChat method

##### GroupChatViewModel class









 talawa 1.0.0+1 
