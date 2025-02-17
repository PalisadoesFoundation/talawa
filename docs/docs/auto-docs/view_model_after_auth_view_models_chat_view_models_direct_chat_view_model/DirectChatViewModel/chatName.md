:::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [chatName]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [chatName]{.name}(

1.  [[dynamic]{.type-annotation}
    [chatId]{.parameter-name}]{#chatName-param-chatId .parameter}

)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void chatName(chatId) {
  final List<ChatUser> users =
      _chats.firstWhere((element) => element.id == chatId).users!;

  users.forEach((element) {
    if (element.id != userConfig.currentUser.id!) {
      name = element.firstName;
    }
  });
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
4.  chatName method

##### DirectChatViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
