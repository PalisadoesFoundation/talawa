::::::: {#dartdoc-main-content .main-content above-sidebar="utils_post_queries/PostQueries-class-sidebar.html" below-sidebar=""}
<div>

# [removePost]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[removePost]{.name}()
:::

::: {.section .desc .markdown}
Mutation to remove the post.

**params**: None

**returns**:

-   `String`: query is returned
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String removePost() {
  return '''
  mutation RemovePost(\$id: ID!) {
    removePost(id: \$id) {
      _id
    }
  }
  ''';
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_queries](../../utils_post_queries/)
3.  [PostQueries](../../utils_post_queries/PostQueries-class.html)
4.  removePost method

##### PostQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
