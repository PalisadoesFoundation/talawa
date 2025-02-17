::::::: {#dartdoc-main-content .main-content above-sidebar="services_chat_service/ChatService-class-sidebar.html" below-sidebar=""}
<div>

# [getDirectChatMessagesByChatId]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[getDirectChatMessagesByChatId]{.name}(

1.  [[dynamic]{.type-annotation}
    [chatId]{.parameter-name}]{#getDirectChatMessagesByChatId-param-chatId
    .parameter}

)
:::

::: {.section .desc .markdown}
This function retrieves direct chat messages by chat ID.

**params**:

-   `chatId`: The ID of the chat for which messages are to be retrieved.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> getDirectChatMessagesByChatId(chatId) async {
  // trigger graphQL query to get all the chat messages
  // of a particular chat using [chatId].
  final String query =
      ChatQueries().fetchDirectChatMessagesByChatId(chatId as String);

  final result = await _dbFunctions.gqlAuthQuery(query);

  final messages = result.data?['directChatsMessagesByChatID'] as List;

  messages.forEach((message) {
    final chatMessage = ChatMessage.fromJson(message as Map<String, dynamic>);
    _chatMessageController.add(chatMessage);
  });
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.html)
4.  getDirectChatMessagesByChatId method

##### ChatService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
