



menu

1.  [talawa](../../index.md)
2.  [services/chat_service.dart](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  updateChat method


updateChat


 dark_mode   light_mode 




<div>

# updateChat method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]




Updates a chat\'s name and/or description.

**params**:

-   `chatId`: The ID of the chat to update
-   `newName`: The new name for the chat (optional)
-   `newDescription`: The new description for the chat (optional)

**returns**:

-   `Future<bool>`: True if chat was updated successfully, false
    otherwise



## Implementation

``` language-dart
Future<bool>  =>
    _coreService.updateChat(
      chatId: chatId,
      newName: newName,
      newDescription: newDescription,
    );
```







1.  [talawa](../../index.md)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  updateChat method

##### ChatService class









 talawa 1.0.0+1 
