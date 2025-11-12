



menu

1.  [talawa](../../index.md)
2.  [view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  sendMessageToGroupChat method


sendMessageToGroupChat


 dark_mode   light_mode 




<div>

# sendMessageToGroupChat method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
sendMessageToGroupChat(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    chatId, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    messageText]

)



Send text message to a group chat.

**params**:

-   `chatId`: id of a group chat to which message is to be sent.
-   `messageText`: text of a message to be sent.

**returns**: None



## Implementation

``` language-dart
Future<void> sendMessageToGroupChat(String chatId, String messageText) async 
```







1.  [talawa](../../index.md)
2.  [group_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  sendMessageToGroupChat method

##### GroupChatViewModel class









 talawa 1.0.0+1 
