



menu

1.  [talawa](../../index.md)
2.  [utils/chat_utils.dart](../../utils_chat_utils/)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  formatGroupName static method


formatGroupName


 dark_mode   light_mode 




<div>

# formatGroupName static method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
formatGroupName(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    userInput, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    chatId]

)



Formats a group name by appending the chatId suffix for uniqueness.

This ensures that group names are unique by appending the chat ID.
Format: \"UserInputName_chatId\"

**params**:

-   `userInput`: The user\'s desired group name
-   `chatId`: The unique chat ID

**returns**:

-   `String`: The formatted group name with chatId suffix



## Implementation

``` language-dart
static String formatGroupName(String userInput, String chatId) 
```







1.  [talawa](../../index.md)
2.  [chat_utils](../../utils_chat_utils/)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  formatGroupName static method

##### ChatUtils class









 talawa 1.0.0+1 
