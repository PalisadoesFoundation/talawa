



menu

1.  [talawa](../../index.md)
2.  [view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  removeGroupMember method


removeGroupMember


 dark_mode   light_mode 




<div>

# removeGroupMember method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]




Removes a member from the group chat (admin only).

**params**:

-   `chatId`: The ID of the group chat
-   `memberId`: The ID of the member to remove
-   `chat`: The chat object for validation

**returns**:

-   `Future<bool>`: True if member was removed successfully, false
    otherwise



## Implementation

``` language-dart
Future<bool>  async 
```







1.  [talawa](../../index.md)
2.  [group_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  removeGroupMember method

##### GroupChatViewModel class









 talawa 1.0.0+1 
