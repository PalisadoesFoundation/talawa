::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/post_queries.dart](../../utils_post_queries/)
3.  [PostQueries](../../utils_post_queries/PostQueries-class.html)
4.  getPostsById method

::: self-name
getPostsById
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_post_queries/PostQueries-class-sidebar.html" below-sidebar=""}
<div>

# [getPostsById]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[getPostsById]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [orgId]{.parameter-name}, ]{#getPostsById-param-orgId .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation}
    [after]{.parameter-name}, ]{#getPostsById-param-after .parameter}
3.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation}
    [before]{.parameter-name}, ]{#getPostsById-param-before .parameter}
4.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]{.type-annotation}
    [first]{.parameter-name}, ]{#getPostsById-param-first .parameter}
5.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]{.type-annotation}
    [last]{.parameter-name}, ]{#getPostsById-param-last .parameter}

)
:::

::: {.section .desc .markdown}
Getting Posts by Id.

**params**:

-   `orgId`: The organisation id
-   `after`: The cursor after which the posts are to be fetched
-   `before`: The cursor before which the posts are to be fetched
-   `first`: The number of posts to be fetched from the start
-   `last`: The number of posts to be fetched from the end

**returns**:

-   `String`: The query related to gettingPostsbyId
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String getPostsById(
  String orgId,
  String? after,
  String? before,
  int? first,
  int? last,
) {
  print(after);
  final String? afterValue = after != null ? '"$after"' : null;
  final String? beforeValue = before != null ? '"$before"' : null;

  return """
    query {
      organizations(id: "$orgId") {
        posts(first: $first, last:$last,after:  $afterValue, before: $beforeValue) {
        edges {
        node {
          _id
          title
          text
          imageUrl
          videoUrl
          creator {
            _id
            firstName
            lastName
            email
          }
          createdAt
          likeCount
          commentCount
            likedBy{
          _id
        }
        comments{
          _id
        }
          pinned
        }
        cursor
      }
      pageInfo {
        startCursor
        endCursor
        hasNextPage
        hasPreviousPage
      }
      totalCount
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
4.  getPostsById method

##### PostQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
