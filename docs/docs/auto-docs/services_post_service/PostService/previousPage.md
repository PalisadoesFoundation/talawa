::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/post_service.dart](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.html)
4.  previousPage method

::: self-name
previousPage
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_post_service/PostService-class-sidebar.html" below-sidebar=""}
<div>

# [previousPage]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[previousPage]{.name}()
:::

::: {.section .desc .markdown}
Method to handle pagination by fetching previous page of posts.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> previousPage() async {
  if (postInfo!['hasPreviousPage'] == true) {
    _posts.clear();
    _renderedPostID.clear();
    before = postInfo!['startCursor'] as String;
    after = null;
    last = 5;
    first = null;
    await getPosts();
  }
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
4.  previousPage method

##### PostService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
