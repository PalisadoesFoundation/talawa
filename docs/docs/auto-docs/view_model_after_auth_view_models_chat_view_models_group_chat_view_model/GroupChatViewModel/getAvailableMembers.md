



menu

1.  [talawa](../../index.md)
2.  [view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  getAvailableMembers method


getAvailableMembers


 dark_mode   light_mode 




<div>

# getAvailableMembers method

</div>


[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../../models_user_user_info/User-class.md)]\>]]
getAvailableMembers(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    chatId]

)



Gets available members for adding to a group chat.

Returns organization members who are not already in the chat.

**params**:

-   `chatId`: The ID of the group chat

**returns**:

-   `List<User>`: List of available organization members



## Implementation

``` language-dart
List<User> getAvailableMembers(String chatId) 
```







1.  [talawa](../../index.md)
2.  [group_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  getAvailableMembers method

##### GroupChatViewModel class









 talawa 1.0.0+1 
