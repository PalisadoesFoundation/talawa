



menu

1.  [talawa](../../index.md)
2.  [utils/chat_utils.dart](../../utils_chat_utils/)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  extractGroupName static method


extractGroupName


 dark_mode   light_mode 




<div>

# extractGroupName static method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
extractGroupName(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    chatName]

)



Extracts the group name by removing the chatId suffix.

Group chats may have their chatId appended as a suffix to ensure
uniqueness. This method removes that suffix to get the user-friendly
name.

**params**:

-   `chatName`: The full chat name that may include chatId suffix

**returns**:

-   `String`: The group name without the chatId suffix



## Implementation

``` language-dart
static String extractGroupName(String chatName) 
```







1.  [talawa](../../index.md)
2.  [chat_utils](../../utils_chat_utils/)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  extractGroupName static method

##### ChatUtils class









 talawa 1.0.0+1 
