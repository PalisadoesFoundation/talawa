



menu

1.  [talawa](../../index.md)
2.  [services/chat_service.dart](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  subscribeToChatMessages method


subscribeToChatMessages


 dark_mode   light_mode 




<div>

# subscribeToChatMessages method

</div>


[[Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[ChatMessage](../../models_chats_chat_message/ChatMessage-class.md)]\>]]
subscribeToChatMessages(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    chatId]

)



Subscribes to real-time chat messages for a specific chat.

**params**:

-   `chatId`: The ID of the chat to subscribe to

**returns**:

-   `Stream<ChatMessage>`: Stream of incoming messages for the specified
    chat



## Implementation

``` language-dart
Stream<ChatMessage> subscribeToChatMessages(String chatId) =>
    _messageService.subscribeToChatMessages(chatId);
```







1.  [talawa](../../index.md)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  subscribeToChatMessages method

##### ChatService class









 talawa 1.0.0+1 
