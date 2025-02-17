:::::: {#dartdoc-main-content .main-content above-sidebar="utils_chat_queries/ChatQueries-class-sidebar.html" below-sidebar=""}
<div>

# [fetchDirectChatMessagesByChatId]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[fetchDirectChatMessagesByChatId]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [chatId]{.parameter-name}]{#fetchDirectChatMessagesByChatId-param-chatId
    .parameter}

)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String fetchDirectChatMessagesByChatId(String chatId) {
  return '''
      query {
        directChatsMessagesByChatID(id: "$chatId") {
          _id
          messageContent
          sender {
            _id
            firstName
            image
          }
          receiver {
            _id
            firstName
            image
          }
        }
      }
  ''';
}
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [chat_queries](../../utils_chat_queries/)
3.  [ChatQueries](../../utils_chat_queries/ChatQueries-class.html)
4.  fetchDirectChatMessagesByChatId method

##### ChatQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
