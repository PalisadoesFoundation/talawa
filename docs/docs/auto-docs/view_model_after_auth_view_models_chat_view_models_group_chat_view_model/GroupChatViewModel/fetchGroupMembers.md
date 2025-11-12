



menu

1.  [talawa](../../index.md)
2.  [view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  fetchGroupMembers method


fetchGroupMembers


 dark_mode   light_mode 




<div>

# fetchGroupMembers method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)?]\>]]




Fetches all members of a specific group chat with pagination support.

This method uses the ChatService. to load members with
pagination, which is useful for groups with many members.

**params**:

-   `chatId`: The ID of the group chat
-   `limit`: Maximum number of members to fetch (default: 32)

**returns**:

-   `Future<List<dynamic>?>`: List of chat members or null if failed



## Implementation

``` language-dart
Future<List<dynamic>?>  async 
```







1.  [talawa](../../index.md)
2.  [group_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  fetchGroupMembers method

##### GroupChatViewModel class









 talawa 1.0.0+1 
