



menu

1.  [talawa](../../index.md)
2.  [view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  createGroupChat method


createGroupChat


 dark_mode   light_mode 




<div>

# createGroupChat method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Chat](../../models_chats_chat/Chat-class.md)?]\>]]




Creates a new group chat.

**params**:

-   `groupName`: The name of the group chat
-   `description`: Optional description for the group chat
-   `memberIds`: List of user IDs to add to the group (excluding
    creator)

**returns**:

-   `Future<Chat?>`: The created group chat or null if failed



## Implementation

``` language-dart
Future<Chat?>  async 
```







1.  [talawa](../../index.md)
2.  [group_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  createGroupChat method

##### GroupChatViewModel class









 talawa 1.0.0+1 
