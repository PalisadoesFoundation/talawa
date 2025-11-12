



menu

1.  [talawa](../../index.md)
2.  [utils/chat_utils.dart](../../utils_chat_utils/)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  isCurrentUserAdmin static method


isCurrentUserAdmin


 dark_mode   light_mode 




<div>

# isCurrentUserAdmin static method

</div>


[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
isCurrentUserAdmin(

1.  [[[Chat](../../models_chats_chat/Chat-class.md)]
    chat, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    currentUserId]

)



Checks if the current user is the admin (creator) of a group chat.

**params**:

-   `chat`: The chat to check
-   `currentUserId`: The ID of the current user

**returns**:

-   `bool`: True if the current user is the admin, false otherwise



## Implementation

``` language-dart
static bool isCurrentUserAdmin(Chat chat, String currentUserId) 
```







1.  [talawa](../../index.md)
2.  [chat_utils](../../utils_chat_utils/)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  isCurrentUserAdmin static method

##### ChatUtils class









 talawa 1.0.0+1 
