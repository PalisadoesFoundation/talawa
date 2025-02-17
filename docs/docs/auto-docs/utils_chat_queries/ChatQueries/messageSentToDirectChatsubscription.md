::::::: {#dartdoc-main-content .main-content above-sidebar="utils_chat_queries/ChatQueries-class-sidebar.html" below-sidebar=""}
<div>

# [messageSentToDirectChatsubscription]{.kind-property} property

</div>

::::: {#getter .section}
::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
get [messageSentToDirectChatsubscription]{.name}
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String get messageSentToDirectChatsubscription => '''
    subscription{
      messageSentToDirectChat{
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
```
:::
:::::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [chat_queries](../../utils_chat_queries/)
3.  [ChatQueries](../../utils_chat_queries/ChatQueries-class.html)
4.  messageSentToDirectChatsubscription property

##### ChatQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
