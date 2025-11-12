



menu

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/chat/widgets/group_chat_dialogs.dart](../../views_after_auth_screens_chat_widgets_group_chat_dialogs/)
3.  [GroupChatDialogs](../../views_after_auth_screens_chat_widgets_group_chat_dialogs/GroupChatDialogs-class.md)
4.  showDeleteGroupDialog static method


showDeleteGroupDialog


 dark_mode   light_mode 




<div>

# showDeleteGroupDialog static method

</div>


void showDeleteGroupDialog(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)]
    context, ]
2.  [[[GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)]
    model, ]
3.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    chatId]

)



Shows delete group confirmation dialog (admin only).

**params**:

-   `context`: The build context
-   `model`: The GroupChatViewModel instance
-   `chatId`: The ID of the chat

**returns**: None



## Implementation

``` language-dart
static void showDeleteGroupDialog(
  BuildContext context,
  GroupChatViewModel model,
  String chatId,
) 
```







1.  [talawa](../../index.md)
2.  [group_chat_dialogs](../../views_after_auth_screens_chat_widgets_group_chat_dialogs/)
3.  [GroupChatDialogs](../../views_after_auth_screens_chat_widgets_group_chat_dialogs/GroupChatDialogs-class.md)
4.  showDeleteGroupDialog static method

##### GroupChatDialogs class









 talawa 1.0.0+1 
