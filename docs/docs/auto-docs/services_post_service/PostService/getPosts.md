::::::: {#dartdoc-main-content .main-content above-sidebar="services_post_service/PostService-class-sidebar.html" below-sidebar=""}
<div>

# [getPosts]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[getPosts]{.name}()
:::

::: {.section .desc .markdown}
Method used to fetch all posts of the current organisation.

**params**: None

**returns**:

-   `Future<void>`: returns future void
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> getPosts() async {
  final List<Post> newPosts = await getNewFeedAndRefreshCache();
  newPosts.forEach((post) {
    if (!_renderedPostID.contains(post.sId)) {
      _posts.insert(0, post);
      _renderedPostID.add(post.sId);
    }
  });
  debugPrint(_posts.length.toString());
  _postStreamController.add(_posts);
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
4.  getPosts method

##### PostService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
