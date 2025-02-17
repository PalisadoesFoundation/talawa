
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
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   DirectChatViewModel



## Constructors

[DirectChatViewModel](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/DirectChatViewModel.html)

:   



## Properties

[[chatMessagesByUser](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chatMessagesByUser.html)] [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], [[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ChatMessage](../models_chats_chat_message/ChatMessage-class.html)]\>]]\>]]

:   ::: features
    no setter
    :::

[[chats](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chats.html)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ChatListTileDataModel](../models_chats_chat_list_tile_data_model/ChatListTileDataModel-class.html)]\>]]

:   ::: features
    no setter
    :::

[[chatState](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chatState.html)] [↔ [ChatState](../enums_enums/ChatState.html)]

:   ::: features
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

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[listKey](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/listKey.html)] [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[AnimatedListState](https://api.flutter.dev/flutter/widgets/AnimatedListState-class.html)]\>]]

:   ::: features
    final
    :::

[[name](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/name.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]

:   ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)] [→ [ViewState](../enums_enums/ViewState.html)]

:   ::: features
    no setterinherited
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[chatName](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chatName.html)]([[dynamic chatId]) → void ]

:   

[dispose](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    override
    :::

[[getChatMessages](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/getChatMessages.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] chatId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function get all messages for a chat.

[[initialise](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/initialise.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]

:   

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html) [→ void ]
:   Call all the registered listeners.
    ::: features
    inherited
    :::

[refreshChats](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/refreshChats.html) [→ void ]
:   This function refresh the chats.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[sendMessageToDirectChat](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/sendMessageToDirectChat.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] chatId, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] messageContent]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function send the message to Direct Chat.

[[setState](../view_model_base_view_model/BaseModel/setState.html)][([[[ViewState](../enums_enums/ViewState.html)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [direct_chat_view_model](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  DirectChatViewModel class

##### direct_chat_view_model library







