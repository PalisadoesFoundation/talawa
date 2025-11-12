



menu

1.  [talawa](../../index.md)
2.  [view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  deleteGroupChat method


deleteGroupChat


 dark_mode   light_mode 




<div>

# deleteGroupChat method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]
deleteGroupChat(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    chatId]

)



Deletes a group chat (admin only).

**params**:

-   `chatId`: The ID of the group chat to delete

**returns**:

-   `Future<bool>`: True if group was deleted successfully, false
    otherwise



## Implementation

``` language-dart
Future<bool> deleteGroupChat(String chatId) async 
```







1.  [talawa](../../index.md)
2.  [group_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  deleteGroupChat method

##### GroupChatViewModel class









 talawa 1.0.0+1 
