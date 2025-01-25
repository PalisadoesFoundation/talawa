::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [widgets/pinned_post.dart](../../widgets_pinned_post/)
3.  [PinnedPost](../../widgets_pinned_post/PinnedPost-class.html)
4.  toMap method

::: self-name
toMap
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="widgets_pinned_post/PinnedPost-class-sidebar.html" below-sidebar=""}
<div>

# [toMap]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[toMap]{.name}(

1.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation}
    [index]{.parameter-name}]{#toMap-param-index .parameter}

)
:::

::: {.section .desc .markdown}
converts post to mapped string.

**params**:

-   `index`: current index

**returns**:

-   `Map<String, String>`: returns a map
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Map<String, String> toMap(int index) {
  return {
    'title': this.pinnedPost[index].description!,
    'postId': this.pinnedPost[index].sId,
    'imageUrl': this.pinnedPost[index].imageUrl!,
    'time': getTimeDifferenceInHours(
      this.pinnedPost[index].createdAt!.toIso8601String(),
    ),
  };
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [pinned_post](../../widgets_pinned_post/)
3.  [PinnedPost](../../widgets_pinned_post/PinnedPost-class.html)
4.  toMap method

##### PinnedPost class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
