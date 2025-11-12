



menu

1.  [talawa](../../index.md)
2.  [services/chat_service.dart](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  hasMoreMessages method


hasMoreMessages


 dark_mode   light_mode 




<div>

# hasMoreMessages method

</div>


[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
hasMoreMessages(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    chatId]

)



Checks if there are more messages to load for a specific chat.

**params**:

-   `chatId`: The ID of the chat

**returns**:

-   `bool`: True if there are more messages to load



## Implementation

``` language-dart
bool hasMoreMessages(String chatId) =>
    _messageService.hasMoreMessages(chatId);
```







1.  [talawa](../../index.md)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  hasMoreMessages method

##### ChatService class









 talawa 1.0.0+1 
