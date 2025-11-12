



menu

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/chat/group_chats.dart](../../views_after_auth_screens_chat_group_chats/)
3.  [GroupChats](../../views_after_auth_screens_chat_group_chats/GroupChats-class.md)
4.  onRefresh method


onRefresh


 dark_mode   light_mode 




<div>

# onRefresh method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
onRefresh(

1.  [[[GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)]
    model]

)



Handles the refresh action for the group chat list.

This method is called when the user pulls down to refresh the group chat
list. It sets the chat state to loading, triggers a refresh of the group
chats, and adds a small delay for better user experience.

**params**:

-   `model`: The GroupChatViewModel instance to refresh

**returns**: None



## Implementation

``` language-dart
Future<void> onRefresh(GroupChatViewModel model) async 
```







1.  [talawa](../../index.md)
2.  [group_chats](../../views_after_auth_screens_chat_group_chats/)
3.  [GroupChats](../../views_after_auth_screens_chat_group_chats/GroupChats-class.md)
4.  onRefresh method

##### GroupChats class









 talawa 1.0.0+1 
