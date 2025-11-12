



menu

1.  [talawa](../../index.md)
2.  [services/chat_service.dart](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  createChatMembership method


createChatMembership


 dark_mode   light_mode 




<div>

# createChatMembership method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]




Creates a chat membership (adds a user to a chat).

**params**:

-   `chatId`: The ID of the chat
-   `userId`: The ID of the user to add

**returns**:

-   `Future<bool>`: True if successful, false otherwise



## Implementation

``` language-dart
Future<bool>  =>
    _membershipService.createChatMembership(
      chatId: chatId,
      userId: userId,
    );
```







1.  [talawa](../../index.md)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  createChatMembership method

##### ChatService class









 talawa 1.0.0+1 
