::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [services/chat_service.dart](../services_chat_service/)
3.  ChatService class

::: self-name
ChatService
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_chat_service/services_chat_service-library-sidebar.html" below-sidebar="services_chat_service/ChatService-class-sidebar.html"}
<div>

# [ChatService]{.kind-class} class

</div>

::: {.section .desc .markdown}
Provides different services for direct chats of the user.

Services include:

-   `sendMessageToDirectChat` - used to send messages.
-   `getDirectChatsByUserId` - used to get all chats by the user.
-   `getDirectChatMessagesByChatId` - gets all chats of a user with
    another user.
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[ChatService](../services_chat_service/ChatService/ChatService.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[chatListStream](../services_chat_service/ChatService/chatListStream.html)]{.name} [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[ChatListTileDataModel](../models_chats_chat_list_tile_data_model/ChatListTileDataModel-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Getter for chat list stream.
    ::: features
    [no setter]{.feature}
    :::

[[chatMessagesStream](../services_chat_service/ChatService/chatMessagesStream.html)]{.name} [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[ChatMessage](../models_chats_chat_message/ChatMessage-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Getter for chat messages stream.
    ::: features
    [no setter]{.feature}
    :::

[[chatStream](../services_chat_service/ChatService/chatStream.html)]{.name} [↔ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   Stream for GraphQL query results.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[getDirectChatMessagesByChatId](../services_chat_service/ChatService/getDirectChatMessagesByChatId.html)]{.name}[([[dynamic]{.type-annotation} [chatId]{.parameter-name}]{#getDirectChatMessagesByChatId-param-chatId .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function retrieves direct chat messages by chat ID.

[[getDirectChatsByUserId](../services_chat_service/ChatService/getDirectChatsByUserId.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Retrieves direct chats by user ID.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[sendMessageToDirectChat](../services_chat_service/ChatService/sendMessageToDirectChat.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [chatId]{.parameter-name}, ]{#sendMessageToDirectChat-param-chatId .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [messageContent]{.parameter-name}]{#sendMessageToDirectChat-param-messageContent .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Sends a message to a direct chat.

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
2.  [chat_service](../services_chat_service/)
3.  ChatService class

##### chat_service library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
