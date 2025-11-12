



menu

1.  [talawa](../../index.md)
2.  [utils/chat_utils.dart](../../utils_chat_utils/)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  validateAdminAction static method


validateAdminAction


 dark_mode   light_mode 




<div>

# validateAdminAction static method

</div>


[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
dynamic\>]]




Checks if a user can perform admin actions on a chat.

**params**:

-   `chat`: The chat to check
-   `currentUserId`: The ID of the current user
-   `action`: The action to validate (\'rename\', \'add_member\',
    \'remove_member\', \'delete\')

**returns**:

-   `Map<String, dynamic>`: Map with \'isValid\' boolean and \'error\'
    string if invalid



## Implementation

``` language-dart
static Map<String, dynamic>  
```







1.  [talawa](../../index.md)
2.  [chat_utils](../../utils_chat_utils/)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  validateAdminAction static method

##### ChatUtils class









 talawa 1.0.0+1 
