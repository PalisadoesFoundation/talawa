



menu

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/chat/widgets/group_chat_management_dialogs.dart](../../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/)
3.  [GroupChatManagementDialogs](../../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs-class.md)
4.  addSelectedMembers static method


addSelectedMembers


 dark_mode   light_mode 




<div>

# addSelectedMembers static method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
addSelectedMembers(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[User](../../models_user_user_info/User-class.md)]\>]]
    selectedMembers,
    ]
2.  [[[GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)]
    model, ]
3.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    chatId]

)



Adds selected members to the group chat.

**params**:

-   `selectedMembers`: List of users to add to the group
-   `model`: The GroupChatViewModel instance
-   `chatId`: The ID of the chat

**returns**: None



## Implementation

``` language-dart
static Future<void> addSelectedMembers(
  List<User> selectedMembers,
  GroupChatViewModel model,
  String chatId,
) async 
```







1.  [talawa](../../index.md)
2.  [group_chat_management_dialogs](../../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/)
3.  [GroupChatManagementDialogs](../../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs-class.md)
4.  addSelectedMembers static method

##### GroupChatManagementDialogs class









 talawa 1.0.0+1 
