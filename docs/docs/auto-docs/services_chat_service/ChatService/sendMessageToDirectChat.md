::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/chat_service.dart](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.html)
4.  sendMessageToDirectChat method

::: self-name
sendMessageToDirectChat
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_chat_service/ChatService-class-sidebar.html" below-sidebar=""}
<div>

# [sendMessageToDirectChat]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[sendMessageToDirectChat]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [chatId]{.parameter-name}, ]{#sendMessageToDirectChat-param-chatId
    .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [messageContent]{.parameter-name}]{#sendMessageToDirectChat-param-messageContent
    .parameter}

)
:::

::: {.section .desc .markdown}
Sends a message to a direct chat.

**params**:

-   `chatId`: The ID of the chat where the message will be sent.
-   `messageContent`: The content of the message to be sent.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> sendMessageToDirectChat(
  String chatId,
  String messageContent,
) async {
  // trigger graphQL mutation to push the message in the Database.
  final result = await _dbFunctions.gqlAuthMutation(
    ChatQueries().sendMessageToDirectChat(),
    variables: {"chatId": chatId, "messageContent": messageContent},
  );

  final message = ChatMessage.fromJson(
    result.data?['sendMessageToDirectChat'] as Map<String, dynamic>,
  );

  _chatMessageController.add(message);

  debugPrint(result.data.toString());
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.html)
4.  sendMessageToDirectChat method

##### ChatService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
