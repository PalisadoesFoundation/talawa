



menu

1.  [talawa](../../index.md)
2.  [models/chats/chat_user.dart](../../models_chats_chat_user/)
3.  [ChatUser](../../models_chats_chat_user/ChatUser-class.md)
4.  ChatUser.fromJson factory constructor


ChatUser.fromJson


 dark_mode   light_mode 




<div>

# ChatUser.fromJson constructor

</div>


ChatUser.fromJson(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    json]

)



Creates a `ChatUser` instance from a JSON object.

The `json` parameter is a map containing the user data. Handles the new
PostgreSQL API format with \'name\' and \'avatarURL\' fields.

**params**:

-   `json`: Map containing user data from API

**returns**:

-   `ChatUser`: Parsed chat user instance



## Implementation

``` language-dart
factory ChatUser.fromJson(Map<String, dynamic> json) 
```







1.  [talawa](../../index.md)
2.  [chat_user](../../models_chats_chat_user/)
3.  [ChatUser](../../models_chats_chat_user/ChatUser-class.md)
4.  ChatUser.fromJson factory constructor

##### ChatUser class









 talawa 1.0.0+1 
