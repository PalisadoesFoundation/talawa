



menu

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/chat/group_chats.dart](../../views_after_auth_screens_chat_group_chats/)
3.  [GroupChatTile](../../views_after_auth_screens_chat_group_chats/GroupChatTile-class.md)
4.  getGroupChatDisplayName method


getGroupChatDisplayName


 dark_mode   light_mode 




<div>

# getGroupChatDisplayName method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
getGroupChatDisplayName(

1.  [[[ChatListTileDataModel](../../models_chats_chat_list_tile_data_model/ChatListTileDataModel-class.md)]
    chat]

)



Gets the display name for a group chat.

If the chat has a name, use it. Otherwise, create a name from member
names.

**params**:

-   `chat`: The ChatListTileDataModel containing chat information

**returns**:

-   `String`: The display name for the group chat



## Implementation

``` language-dart
String getGroupChatDisplayName(ChatListTileDataModel chat) 
```







1.  [talawa](../../index.md)
2.  [group_chats](../../views_after_auth_screens_chat_group_chats/)
3.  [GroupChatTile](../../views_after_auth_screens_chat_group_chats/GroupChatTile-class.md)
4.  getGroupChatDisplayName method

##### GroupChatTile class









 talawa 1.0.0+1 
