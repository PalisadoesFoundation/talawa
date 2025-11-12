



menu

1.  [talawa](../../index.md)
2.  [services/chat_service.dart](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
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
  String chatId, ) =>
    _messageService.getChatDetails(chatId, isInitialLoad: isInitialLoad);
```







1.  [talawa](../../index.md)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  getChatDetails method

##### ChatService class









 talawa 1.0.0+1 
