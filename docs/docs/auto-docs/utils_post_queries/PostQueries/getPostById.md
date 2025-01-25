::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/post_queries.dart](../../utils_post_queries/)
3.  [PostQueries](../../utils_post_queries/PostQueries-class.html)
4.  getPostById method

::: self-name
getPostById
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_post_queries/PostQueries-class-sidebar.html" below-sidebar=""}
<div>

# [getPostById]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[getPostById]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [postId]{.parameter-name}]{#getPostById-param-postId .parameter}

)
:::

::: {.section .desc .markdown}
Getting Post by Post Id.

**params**:

-   `postId`: The post id

**returns**:

-   `String`: The query related to gettingPostsbyId
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String getPostById(String postId) {
  return """
    query {
      post(id: "$postId")
      {
        _id
        text
        createdAt
        imageUrl
        videoUrl
        title
        commentCount
        likeCount
        creator{
          _id
          firstName
          lastName
          image
        }
        organization{
          _id
        }
        likedBy{
          _id
        }
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
2.  [post_queries](../../utils_post_queries/)
3.  [PostQueries](../../utils_post_queries/PostQueries-class.html)
4.  getPostById method

##### PostQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
