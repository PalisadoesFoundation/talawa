



menu

1.  [talawa](../../index.md)
2.  [services/chat_service.dart](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  addChatMember method


addChatMember


 dark_mode   light_mode 




<div>

# addChatMember method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]




Adds a member to an existing chat.

**params**:

-   `chatId`: The ID of the chat
-   `userId`: The ID of the user to add

**returns**:

-   `Future<bool>`: True if member was added successfully, false
    otherwise



## Implementation

``` language-dart
Future<bool>  =>
    _membershipService.addChatMember(chatId: chatId, userId: userId);
```







1.  [talawa](../../index.md)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  addChatMember method

##### ChatService class









 talawa 1.0.0+1 
