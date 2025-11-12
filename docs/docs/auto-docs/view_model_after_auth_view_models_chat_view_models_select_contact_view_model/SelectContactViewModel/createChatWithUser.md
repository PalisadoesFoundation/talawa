



menu

1.  [talawa](../../index.md)
2.  [view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart](../../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/)
3.  [SelectContactViewModel](../../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel-class.md)
4.  createChatWithUser method


createChatWithUser


 dark_mode   light_mode 




<div>

# createChatWithUser method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]\>]]
createChatWithUser(

1.  [[[User](../../models_user_user_info/User-class.md)]
    selectedUser]

)



Function to create a new chat with a selected user.

**params**:

-   `selectedUser`: The user to create a chat with.

**returns**:

-   `Future<String?>`: The chat ID if successfully created, null
    otherwise.



## Implementation

``` language-dart
Future<String?> createChatWithUser(User selectedUser) async 
```







1.  [talawa](../../index.md)
2.  [select_contact_view_model](../../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/)
3.  [SelectContactViewModel](../../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel-class.md)
4.  createChatWithUser method

##### SelectContactViewModel class









 talawa 1.0.0+1 
