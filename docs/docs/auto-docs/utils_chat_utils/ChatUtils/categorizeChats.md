



menu

1.  [talawa](../../index.md)
2.  [utils/chat_utils.dart](../../utils_chat_utils/)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  categorizeChats static method


categorizeChats


 dark_mode   light_mode 




<div>

# categorizeChats static method

</div>


[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Chat](../../models_chats_chat/Chat-class.md)]\>]]\>]]
categorizeChats(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[Chat](../../models_chats_chat/Chat-class.md)]\>]]
    chats]

)



Categorizes chats into groups and direct chats.

**params**:

-   `chats`: List of all chats to categorize

**returns**:

-   `Map<String, List<Chat>>`: Map with \'groups\' and \'direct\' keys
    containing categorized chats



## Implementation

``` language-dart
static Map<String, List<Chat>> categorizeChats(List<Chat> chats) 
```







1.  [talawa](../../index.md)
2.  [chat_utils](../../utils_chat_utils/)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  categorizeChats static method

##### ChatUtils class









 talawa 1.0.0+1 
