



menu

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/chat/direct_chats.dart](../../views_after_auth_screens_chat_direct_chats/)
3.  [DirectChats](../../views_after_auth_screens_chat_direct_chats/DirectChats-class.md)
4.  onRefresh method


onRefresh


 dark_mode   light_mode 




<div>

# onRefresh method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
onRefresh(

1.  [[[DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.md)]
    model]

)



Handles the refresh action for the chat list.

This method is called when the user pulls down to refresh the chat list.
It sets the chat state to loading, triggers a refresh of the chats, and
adds a small delay for better user experience.

**params**:

-   `model`: The DirectChatViewModel instance to refresh

**returns**: None



## Implementation

``` language-dart
Future<void> onRefresh(DirectChatViewModel model) async 
```







1.  [talawa](../../index.md)
2.  [direct_chats](../../views_after_auth_screens_chat_direct_chats/)
3.  [DirectChats](../../views_after_auth_screens_chat_direct_chats/DirectChats-class.md)
4.  onRefresh method

##### DirectChats class









 talawa 1.0.0+1 
