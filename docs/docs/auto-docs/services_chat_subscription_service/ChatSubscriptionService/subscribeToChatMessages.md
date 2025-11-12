



menu

1.  [talawa](../../index.md)
2.  [services/chat_subscription_service.dart](../../services_chat_subscription_service/)
3.  [ChatSubscriptionService](../../services_chat_subscription_service/ChatSubscriptionService-class.md)
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
Stream<ChatMessage> subscribeToChatMessages(String chatId) 
```







1.  [talawa](../../index.md)
2.  [chat_subscription_service](../../services_chat_subscription_service/)
3.  [ChatSubscriptionService](../../services_chat_subscription_service/ChatSubscriptionService-class.md)
4.  subscribeToChatMessages method

##### ChatSubscriptionService class









 talawa 1.0.0+1 
