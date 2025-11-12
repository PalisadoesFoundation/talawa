



menu

1.  [talawa](../../index.md)
2.  [view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.md)
4.  isLoadingMoreMessages method


isLoadingMoreMessages


 dark_mode   light_mode 




<div>

# isLoadingMoreMessages method

</div>


[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
isLoadingMoreMessages(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    chatId]

)



Getter for pagination loading state.

**params**:

-   `chatId`: The ID of the chat to check loading state for.

**returns**:

-   `bool`: True if loading more messages, false otherwise.



## Implementation

``` language-dart
bool isLoadingMoreMessages(String chatId) =>
    _isLoadingMoreMessages[chatId] ?? false;
```







1.  [talawa](../../index.md)
2.  [direct_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.md)
4.  isLoadingMoreMessages method

##### DirectChatViewModel class









 talawa 1.0.0+1 
