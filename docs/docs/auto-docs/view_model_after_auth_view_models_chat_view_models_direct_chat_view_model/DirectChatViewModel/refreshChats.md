::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [refreshChats]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [refreshChats]{.name}()
:::

::: {.section .desc .markdown}
This function refresh the chats.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void refreshChats() {
  _chats.clear();
  _uniqueChatIds.clear();
  notifyListeners();
  _chatService.getDirectChatsByUserId();
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [direct_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4.  refreshChats method

##### DirectChatViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
