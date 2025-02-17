:::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialise]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[initialise]{.name}()
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> initialise() async {
  setState(ViewState.busy);
  chatState = ChatState.loading;

  _chatListSubscription = _chatService.chatListStream.listen((newChat) {
    _uniqueChatIds.add(newChat.id!);
    _chats.insert(0, newChat);
  });

  await _chatService.getDirectChatsByUserId();

  chatState = ChatState.complete;
  setState(ViewState.idle);
}
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [direct_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4.  initialise method

##### DirectChatViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
