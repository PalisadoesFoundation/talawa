::::::: {#dartdoc-main-content .main-content above-sidebar="models_post_post_model/Post-class-sidebar.html" below-sidebar=""}
<div>

# [getPostCreatedDuration]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[getPostCreatedDuration]{.name}()
:::

::: {.section .desc .markdown}
this is to get duration of post.

**params**: None

**returns**:

-   `String`: date is returned in ago form.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String getPostCreatedDuration() {
  if (DateTime.now().difference(this.createdAt!).inSeconds < 60) {
    return '${DateTime.now().difference(this.createdAt!).inSeconds} Seconds Ago';
  } else if (DateTime.now().difference(this.createdAt!).inMinutes < 60) {
    return '${DateTime.now().difference(this.createdAt!).inMinutes} Minutes Ago';
  } else if (DateTime.now().difference(this.createdAt!).inHours < 24) {
    return '${DateTime.now().difference(this.createdAt!).inHours} Hours Ago';
  } else if (DateTime.now().difference(this.createdAt!).inDays < 30) {
    return '${DateTime.now().difference(this.createdAt!).inDays} Days Ago';
  } else if (DateTime.now().difference(this.createdAt!).inDays < 365) {
    return '${DateTime.now().difference(this.createdAt!).inDays ~/ 30} Months Ago';
  } else {
    return '${DateTime.now().difference(this.createdAt!).inDays ~/ 365} Years Ago';
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_model](../../models_post_post_model/)
3.  [Post](../../models_post_post_model/Post-class.html)
4.  getPostCreatedDuration method

##### Post class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
