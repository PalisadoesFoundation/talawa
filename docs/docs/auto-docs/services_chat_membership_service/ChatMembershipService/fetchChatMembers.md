



menu

1.  [talawa](../../index.md)
2.  [services/chat_membership_service.dart](../../services_chat_membership_service/)
3.  [ChatMembershipService](../../services_chat_membership_service/ChatMembershipService-class.md)
4.  fetchChatMembers method


fetchChatMembers


 dark_mode   light_mode 




<div>

# fetchChatMembers method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
dynamic\>]?]\>]]




Fetches members of a specific chat with pagination support.

**params**:

-   `chatId`: The ID of the chat
-   `first`: Number of members to fetch from the beginning (optional)
-   `last`: Number of members to fetch from the end (optional)
-   `after`: Cursor for forward pagination (optional)
-   `before`: Cursor for backward pagination (optional)

**returns**:

-   `Future<Map<String, dynamic>?>`: Chat with members and pagination
    info, or null if failed



## Implementation

``` language-dart
Future<Map<String, dynamic>?>  async 
```







1.  [talawa](../../index.md)
2.  [chat_membership_service](../../services_chat_membership_service/)
3.  [ChatMembershipService](../../services_chat_membership_service/ChatMembershipService-class.md)
4.  fetchChatMembers method

##### ChatMembershipService class









 talawa 1.0.0+1 
