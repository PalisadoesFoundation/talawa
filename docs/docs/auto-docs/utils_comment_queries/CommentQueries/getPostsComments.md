::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/comment_queries.dart](../../utils_comment_queries/)
3.  [CommentQueries](../../utils_comment_queries/CommentQueries-class.html)
4.  getPostsComments method

::: self-name
getPostsComments
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_comment_queries/CommentQueries-class-sidebar.html" below-sidebar=""}
<div>

# [getPostsComments]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[getPostsComments]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [postId]{.parameter-name}]{#getPostsComments-param-postId
    .parameter}

)
:::

::: {.section .desc .markdown}
Get all comments for a post.

**params**:

-   `postId`: The id of the post to get comments for.

**returns**:

-   `String`: The query for getting all comments for a post.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String getPostsComments(String postId) {
  return """
   query {
      post(id: "$postId")
      {  _id,
        comments{
           _id,
          text,
           createdAt
      creator{
        firstName
        lastName
      }
        }
      }
    }
""";
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [comment_queries](../../utils_comment_queries/)
3.  [CommentQueries](../../utils_comment_queries/CommentQueries-class.html)
4.  getPostsComments method

##### CommentQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
