



menu

1.  [talawa](../../index.md)
2.  [services/chat_service.dart](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  deleteChat method


deleteChat


 dark_mode   light_mode 




<div>

# deleteChat method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]
deleteChat(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    chatId]

)



Deletes a chat.

**params**:

-   `chatId`: The ID of the chat to delete

**returns**:

-   `Future<bool>`: True if chat was deleted successfully, false
    otherwise



## Implementation

``` language-dart
Future<bool> deleteChat(String chatId) => _coreService.deleteChat(chatId);
```







1.  [talawa](../../index.md)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  deleteChat method

##### ChatService class









 talawa 1.0.0+1 
