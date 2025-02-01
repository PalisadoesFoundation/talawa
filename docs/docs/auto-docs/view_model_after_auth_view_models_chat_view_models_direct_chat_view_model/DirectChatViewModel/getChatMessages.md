::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4.  getChatMessages method

::: self-name
getChatMessages
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [getChatMessages]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[getChatMessages]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [chatId]{.parameter-name}]{#getChatMessages-param-chatId .parameter}

)
:::

::: {.section .desc .markdown}
This function get all messages for a chat.

params:

-   `chatId` : id of a chat for which messages need to be fetched.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> getChatMessages(String chatId) async {
  _chatMessagesByUser.clear();
  chatState = ChatState.loading;
  // await _chatService.getMessagesFromDirectChat();
  // variable
  final List<ChatMessage> messages = [];
  _chatMessageSubscription =
      _chatService.chatMessagesStream.listen((newMessage) {
    messages.add(newMessage);
    _chatMessagesByUser[chatId] = messages;
  });
  // use `chatService` services
  await _chatService.getDirectChatMessagesByChatId(chatId);
  chatState = ChatState.complete;
  notifyListeners();
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
4.  getChatMessages method

##### DirectChatViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
