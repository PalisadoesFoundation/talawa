



menu

1.  [talawa](../index.md)
2.  [view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  DirectChatViewModel class


DirectChatViewModel


 dark_mode   light_mode 




<div>

# DirectChatViewModel class

</div>


This ViewModel class have different functions that are used interact
with model in the context of Direct Chat.

Functions include:

-   `initialise` : Initialise the states.
-   `getChatMessages` : to get all the messages of a chat.
-   `sendMessageToDirectChat` : to send the message to chat.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   DirectChatViewModel



## Constructors

[DirectChatViewModel](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/DirectChatViewModel.md)

:   



## Properties

[[chatMessagesByUser](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chatMessagesByUser.md)] [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], [[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)]\>]]\>]]
:   This is the getter for the chat messages by user.
    ::: features
    no setter
    :::

[[chats](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chats.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ChatListTileDataModel](../models_chats_chat_list_tile_data_model/ChatListTileDataModel-class.md)]\>]]
:   This is the getter for the unique chat IDs.
    ::: features
    no setter
    :::

[[chatState](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chatState.md)] [↔ [ChatState](../enums_enums/ChatState.md)]
:   State of the chat.
    ::: features
    getter/setter pair
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Whether any listeners are currently registered.
    ::: features
    no setterinherited
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[listKey](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/listKey.md)] [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[AnimatedListState](https://api.flutter.dev/flutter/widgets/AnimatedListState-class.html)]\>]]
:   This is the key for the AnimatedList widget.
    ::: features
    final
    :::

[[name](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/name.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   Name of the chat.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[state](../view_model_base_view_model/BaseModel/state.md)] [→ [ViewState](../enums_enums/ViewState.md)]

:   ::: features
    no setterinherited
    :::

[[userConfig](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/userConfig.md)] [→ [UserConfig](../services_user_config/UserConfig-class.md)]
:   User configuration service for accessing current user information.
    ::: features
    final
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[chatName](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chatName.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] ]
:   Method to return chat name based on the chatId.

[dispose](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/dispose.md) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
    will throw after the object is disposed).
    ::: features
    override
    :::

[[getChatMessages](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/getChatMessages.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function get all messages for a chat.

[[hasMoreMessages](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/hasMoreMessages.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   Check if there are more messages to load for a specific chat.

[[initialise](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/initialise.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function is used to initialise the states.

[[isLoadingMoreMessages](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/isLoadingMoreMessages.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   Getter for pagination loading state.

[[loadMoreMessages](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/loadMoreMessages.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Load more messages (older messages) for a specific chat.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html) [→ void ]
:   Call all the registered listeners.
    ::: features
    inherited
    :::

[refreshChats](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/refreshChats.md) [→ void ]
:   This function refresh the chats.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[sendMessageToDirectChat](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/sendMessageToDirectChat.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] messageContent]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function send the message to Direct Chat.

[[setState](../view_model_base_view_model/BaseModel/setState.md)][([[[ViewState](../enums_enums/ViewState.md)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [direct_chat_view_model](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  DirectChatViewModel class

##### direct_chat_view_model library









 talawa 1.0.0+1 
