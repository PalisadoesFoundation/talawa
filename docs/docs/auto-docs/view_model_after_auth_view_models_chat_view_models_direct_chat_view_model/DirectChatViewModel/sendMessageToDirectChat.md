::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
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
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class-sidebar.html" below-sidebar=""}
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
This function send the message to Direct Chat.

params:

-   `chatId` : id of a chat where message need to be send.
-   `messageContent` : content of a message.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> sendMessageToDirectChat(
  String chatId,
  String messageContent,
) async {
  chatState = ChatState.loading;
  _chatService.chatMessagesStream.listen((newMessage) {
    _chatMessagesByUser[chatId]!.add(newMessage);
  });
  await _chatService.sendMessageToDirectChat(chatId, messageContent);
  chatState = ChatState.complete;
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [direct_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4.  sendMessageToDirectChat method

##### DirectChatViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
