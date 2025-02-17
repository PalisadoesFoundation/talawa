::::::: {#dartdoc-main-content .main-content above-sidebar="services_post_service/PostService-class-sidebar.html" below-sidebar=""}
<div>

# [addCommentLocally]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [addCommentLocally]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [postID]{.parameter-name}]{#addCommentLocally-param-postID
    .parameter}

)
:::

::: {.section .desc .markdown}
Method to add comment of a user and update comments using updated Post
Stream.

**params**:

-   `postID`: ID of the post to add comment locally

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void addCommentLocally(String postID) {
  for (int i = 0; i < _posts.length; i++) {
    if (_posts[i].sId == postID) {
      _posts[i].comments!.add(Comments(sId: postID));
      _updatedPostStreamController.add(_posts[i]);
    }
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.html)
4.  addCommentLocally method

##### PostService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
