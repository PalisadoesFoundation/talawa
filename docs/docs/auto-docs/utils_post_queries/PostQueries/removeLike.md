::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/post_queries.dart](../../utils_post_queries/)
3.  [PostQueries](../../utils_post_queries/PostQueries-class.html)
4.  removeLike method

::: self-name
removeLike
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_post_queries/PostQueries-class-sidebar.html" below-sidebar=""}
<div>

# [removeLike]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[removeLike]{.name}()
:::

::: {.section .desc .markdown}
Remove Like from a post.

**params**: None

**returns**:

-   `String`: The query related to removingLike
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String removeLike() {
  return """
   mutation unlikePost(\$postID: ID!) {
    unlikePost( id: \$postID,)
    {
      _id
      likedBy{
      _id
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
4.  removeLike method

##### PostQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
