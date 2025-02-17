::::::: {#dartdoc-main-content .main-content above-sidebar="utils_post_queries/PostQueries-class-sidebar.html" below-sidebar=""}
<div>

# [uploadPost]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[uploadPost]{.name}()
:::

::: {.section .desc .markdown}
Upload a post to database.

**params**: None

**returns**:

-   `String`: The query related to uploadingPost.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String uploadPost() {
  return '''
  mutation CreatePost(
  \$text: String!
  \$title: String!
  \$imageUrl: URL
  \$videoUrl: URL
  \$organizationId: ID!
  \$file: String
) {
  createPost(
    data: {
      text: \$text
      title: \$title
      imageUrl: \$imageUrl
      videoUrl: \$videoUrl
      organizationId: \$organizationId
    }
    file: \$file
  ) {
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
      _id
        }
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
4.  uploadPost method

##### PostQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
