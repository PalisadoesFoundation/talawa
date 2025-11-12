



menu

1.  [talawa](../../index.md)
2.  [services/chat_service.dart](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  loadMoreMessages method


loadMoreMessages


 dark_mode   light_mode 




<div>

# loadMoreMessages method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ChatMessage](../../models_chats_chat_message/ChatMessage-class.md)]\>]]\>]]
loadMoreMessages(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    chatId]

)



Loads more messages (older messages) for a specific chat.

**params**:

-   `chatId`: The ID of the chat

**returns**:

-   `Future<List<ChatMessage>>`: List of older messages or empty list if
    failed



## Implementation

``` language-dart
Future<List<ChatMessage>> loadMoreMessages(String chatId) =>
    _messageService.loadMoreMessages(chatId);
```







1.  [talawa](../../index.md)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  loadMoreMessages method

##### ChatService class









 talawa 1.0.0+1 
