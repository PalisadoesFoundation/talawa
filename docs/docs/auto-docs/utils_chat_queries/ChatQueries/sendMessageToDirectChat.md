:::::: {#dartdoc-main-content .main-content above-sidebar="utils_chat_queries/ChatQueries-class-sidebar.html" below-sidebar=""}
<div>

# [sendMessageToDirectChat]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[sendMessageToDirectChat]{.name}()
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String sendMessageToDirectChat() {
  return '''
    mutation sendMessageToDirectChat(
      \$chatId: ID!
      \$messageContent: String!
      ){
      sendMessageToDirectChat(
        chatId: \$chatId
        messageContent: \$messageContent
      ) {
        messageContent
          sender{
            firstName
          }
          receiver{
            firstName
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
4.  sendMessageToDirectChat method

##### ChatQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
