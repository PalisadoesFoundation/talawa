



menu

1.  [talawa](../../index.md)
2.  [utils/chat_utils.dart](../../utils_chat_utils/)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  getDisplayName static method


getDisplayName


 dark_mode   light_mode 




<div>

# getDisplayName static method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
getDisplayName(

1.  [[[Chat](../../models_chats_chat/Chat-class.md)]
    chat, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    currentUserId]

)



Gets the display name for a chat based on its type.

For group chats, extracts the clean name without chatId suffix. For
direct chats, creates a name from member names.

**params**:

-   `chat`: The chat to get the display name for
-   `currentUserId`: The ID of the current user (to exclude from direct
    chat names)

**returns**:

-   `String`: The appropriate display name for the chat



## Implementation

``` language-dart
static String getDisplayName(Chat chat, String currentUserId) 
```







1.  [talawa](../../index.md)
2.  [chat_utils](../../utils_chat_utils/)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  getDisplayName static method

##### ChatUtils class









 talawa 1.0.0+1 
