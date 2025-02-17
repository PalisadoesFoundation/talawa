:::::: {#dartdoc-main-content .main-content above-sidebar="utils_chat_queries/ChatQueries-class-sidebar.html" below-sidebar=""}
<div>

# [fetchDirectChatsByUserId]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[fetchDirectChatsByUserId]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [userId]{.parameter-name}]{#fetchDirectChatsByUserId-param-userId
    .parameter}

)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String fetchDirectChatsByUserId(String userId) {
  return '''
    query {
    directChatsByUserID(id: "$userId") {
      _id
      users{
        _id
        firstName
        email
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
4.  fetchDirectChatsByUserId method

##### ChatQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
