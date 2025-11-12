



menu

1.  [talawa](../../index.md)
2.  [view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.md)
4.  sendMessageToDirectChat method


sendMessageToDirectChat


 dark_mode   light_mode 




<div>

# sendMessageToDirectChat method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
sendMessageToDirectChat(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    chatId, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    messageContent]

)



This function send the message to Direct Chat.

**params**:

-   `chatId`: id of a chat where message need to be send.
-   `messageContent`: content of a message.

**returns**: None



## Implementation

``` language-dart
Future<void> sendMessageToDirectChat(
  String chatId,
  String messageContent,
) async 
```







1.  [talawa](../../index.md)
2.  [direct_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.md)
4.  sendMessageToDirectChat method

##### DirectChatViewModel class









 talawa 1.0.0+1 
