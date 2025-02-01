::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/post_service.dart](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.html)
4.  refreshFeed method

::: self-name
refreshFeed
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_post_service/PostService-class-sidebar.html" below-sidebar=""}
<div>

# [refreshFeed]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[refreshFeed]{.name}()
:::

::: {.section .desc .markdown}
Method to refresh feed of current selected organisation.

**params**: None

**returns**:

-   `Future<void>`: returns future void
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> refreshFeed() async {
  final List<Post> newPosts = await getNewFeedAndRefreshCache();
  _renderedPostID.clear();
  _posts.clear();
  _posts = newPosts;
  GraphqlExceptionResolver.encounteredExceptionOrError(
    CriticalActionException('Feed refreshed!!!'),
  );
  _postStreamController.add(_posts);
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.html)
4.  refreshFeed method

##### PostService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
