::::::: {#dartdoc-main-content .main-content above-sidebar="widgets_pinned_post/PinnedPost-class-sidebar.html" below-sidebar=""}
<div>

# [getTimeDifferenceInHours]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[getTimeDifferenceInHours]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [createdAtString]{.parameter-name}]{#getTimeDifferenceInHours-param-createdAtString
    .parameter}

)
:::

::: {.section .desc .markdown}
Function returns the time difference in hours.

**params**:

-   `createdAtString`: the time from post

**returns**:

-   `String`: return a string
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String getTimeDifferenceInHours(String createdAtString) {
  final DateTime now = DateTime.now();
  final DateTime createdAt = DateTime.parse(createdAtString).toLocal();
  final Duration difference = now.difference(createdAt);
  final int hours = difference.inHours;
  return '$hours hrs';
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [pinned_post](../../widgets_pinned_post/)
3.  [PinnedPost](../../widgets_pinned_post/PinnedPost-class.html)
4.  getTimeDifferenceInHours method

##### PinnedPost class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
