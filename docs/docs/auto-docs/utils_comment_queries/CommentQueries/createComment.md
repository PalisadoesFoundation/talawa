::::::: {#dartdoc-main-content .main-content above-sidebar="utils_comment_queries/CommentQueries-class-sidebar.html" below-sidebar=""}
<div>

# [createComment]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[createComment]{.name}()
:::

::: {.section .desc .markdown}
Creating a comment.

**params**: None

**returns**:

-   `String`: The query for creating a comment
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String createComment() {
  return """
   mutation createComment(\$postId: ID!, \$text: String!) {
    createComment(postId: \$postId,
      data:{
        text: \$text,
      }
    ){
      _id
    }
  }
""";
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [comment_queries](../../utils_comment_queries/)
3.  [CommentQueries](../../utils_comment_queries/CommentQueries-class.html)
4.  createComment method

##### CommentQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
