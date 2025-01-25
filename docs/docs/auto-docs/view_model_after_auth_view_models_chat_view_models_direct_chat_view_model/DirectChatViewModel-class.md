::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  DirectChatViewModel class

::: self-name
DirectChatViewModel
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/view_model_after_auth_view_models_chat_view_models_direct_chat_view_model-library-sidebar.html" below-sidebar="view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class-sidebar.html"}
<div>

# [DirectChatViewModel]{.kind-class} class

</div>

::: {.section .desc .markdown}
This ViewModel class have different functions that are used interact
with model in the context of Direct Chat.

Functions include:

-   `initialise` : Initialise the states.
-   `getChatMessages` : to get all the messages of a chat.
-   `sendMessageToDirectChat` : to send the message to chat.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   DirectChatViewModel
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[DirectChatViewModel](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/DirectChatViewModel.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[chatMessagesByUser](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chatMessagesByUser.html)]{.name} [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ChatMessage](../models_chats_chat_message/ChatMessage-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}

:   ::: features
    [no setter]{.feature}
    :::

[[chats](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chats.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ChatListTileDataModel](../models_chats_chat_list_tile_data_model/ChatListTileDataModel-class.html)]{.type-parameter}\>]{.signature}]{.signature}

:   ::: features
    [no setter]{.feature}
    :::

[[chatState](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chatState.html)]{.name} [↔ [ChatState](../enums_enums/ChatState.html)]{.signature}

:   ::: features
    [getter/setter pair]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Whether any listeners are currently registered.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[listKey](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/listKey.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[AnimatedListState](https://api.flutter.dev/flutter/widgets/AnimatedListState-class.html)]{.type-parameter}\>]{.signature}]{.signature}

:   ::: features
    [final]{.feature}
    :::

[[name](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/name.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}

:   ::: features
    [getter/setter pair]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)]{.name} [→ [ViewState](../enums_enums/ViewState.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#addListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Register a closure to be called when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[chatName](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chatName.html)]{.name}[([[dynamic]{.type-annotation} [chatId]{.parameter-name}]{#chatName-param-chatId .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   

[[dispose](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [override]{.feature}
    :::

[[getChatMessages](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/getChatMessages.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [chatId]{.parameter-name}]{#getChatMessages-param-chatId .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function get all messages for a chat.

[[initialise](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/initialise.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}

:   

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Call all the registered listeners.
    ::: features
    [inherited]{.feature}
    :::

[[refreshChats](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/refreshChats.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This function refresh the chats.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#removeListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[sendMessageToDirectChat](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/sendMessageToDirectChat.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [chatId]{.parameter-name}, ]{#sendMessageToDirectChat-param-chatId .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [messageContent]{.parameter-name}]{#sendMessageToDirectChat-param-messageContent .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function send the message to Direct Chat.

[[setState](../view_model_base_view_model/BaseModel/setState.html)]{.name}[([[[ViewState](../enums_enums/ViewState.html)]{.type-annotation} [viewState]{.parameter-name}]{#setState-param-viewState .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [direct_chat_view_model](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  DirectChatViewModel class

##### direct_chat_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
