



menu

1.  [talawa](../../index.md)
2.  [services/chat_service.dart](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  removeChatMember method


removeChatMember


 dark_mode   light_mode 




<div>

# removeChatMember method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]




Removes a member from a chat.

**params**:

-   `chatId`: The ID of the chat
-   `memberId`: The ID of the member to remove

**returns**:

-   `Future<bool>`: True if member was removed successfully, false
    otherwise



## Implementation

``` language-dart
Future<bool>  =>
    _membershipService.removeChatMember(
      chatId: chatId,
      memberId: memberId,
    );
```







1.  [talawa](../../index.md)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  removeChatMember method

##### ChatService class









 talawa 1.0.0+1 
