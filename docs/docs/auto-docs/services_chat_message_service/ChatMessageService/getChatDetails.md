



menu

1.  [talawa](../../index.md)
2.  [services/chat_message_service.dart](../../services_chat_message_service/)
3.  [ChatMessageService](../../services_chat_message_service/ChatMessageService-class.md)
4.  getChatDetails method


getChatDetails


 dark_mode   light_mode 




<div>

# getChatDetails method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Chat](../../models_chats_chat/Chat-class.md)?]\>]]
getChatDetails(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    chatId, )



Retrieves chat details with initial messages.

**params**:

-   `chatId`: The ID of the chat
-   `isInitialLoad`: Whether this is the initial load (for setting up
    pagination)

**returns**:

-   `Future<Chat?>`: The chat with messages or null if failed



## Implementation

``` language-dart
Future<Chat?> getChatDetails(
  String chatId, ) async 
```







1.  [talawa](../../index.md)
2.  [chat_message_service](../../services_chat_message_service/)
3.  [ChatMessageService](../../services_chat_message_service/ChatMessageService-class.md)
4.  getChatDetails method

##### ChatMessageService class









 talawa 1.0.0+1 
