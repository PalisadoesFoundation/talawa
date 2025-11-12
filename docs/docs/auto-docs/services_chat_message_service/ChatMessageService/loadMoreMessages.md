



menu

1.  [talawa](../../index.md)
2.  [services/chat_message_service.dart](../../services_chat_message_service/)
3.  [ChatMessageService](../../services_chat_message_service/ChatMessageService-class.md)
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
Future<List<ChatMessage>> loadMoreMessages(String chatId) async 
```







1.  [talawa](../../index.md)
2.  [chat_message_service](../../services_chat_message_service/)
3.  [ChatMessageService](../../services_chat_message_service/ChatMessageService-class.md)
4.  loadMoreMessages method

##### ChatMessageService class









 talawa 1.0.0+1 
