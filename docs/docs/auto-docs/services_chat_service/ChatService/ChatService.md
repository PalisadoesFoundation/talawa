:::::: {#dartdoc-main-content .main-content above-sidebar="services_chat_service/ChatService-class-sidebar.html" below-sidebar=""}
<div>

# [ChatService]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[ChatService]{.name}()
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
ChatService() {
  _dbFunctions = locator<DataBaseMutationFunctions>();
  _chatListStream = _chatController.stream.asBroadcastStream();
  _chatMessagesStream = _chatMessageController.stream.asBroadcastStream();
}
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.html)
4.  ChatService constructor

##### ChatService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
