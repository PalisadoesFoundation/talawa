



menu

1.  [talawa](../../index.md)
2.  [services/chat_service.dart](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  sendMessage method


sendMessage


 dark_mode   light_mode 




<div>

# sendMessage method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[ChatMessage](../../models_chats_chat_message/ChatMessage-class.md)?]\>]]




Sends a message to a chat.

**params**:

-   `chatId`: The ID of the chat
-   `body`: The content of the message

**returns**:

-   `Future<ChatMessage?>`: The sent message or null if failed



## Implementation

``` language-dart
Future<ChatMessage?>  =>
    _messageService.sendMessage(chatId: chatId, body: body);
```







1.  [talawa](../../index.md)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  sendMessage method

##### ChatService class









 talawa 1.0.0+1 
