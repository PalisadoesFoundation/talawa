::::::: {#dartdoc-main-content .main-content above-sidebar="models_post_post_model/LikedBy-class-sidebar.html" below-sidebar=""}
<div>

# [toJson]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
[dynamic]{.type-parameter}\>]{.signature}]{.returntype}
[toJson]{.name}()
:::

::: {.section .desc .markdown}
Convert dart object to json.

**params**: None

**returns**:

-   `Map<String, dynamic>`: json is returned.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['_id'] = this.sId;
  return data;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_model](../../models_post_post_model/)
3.  [LikedBy](../../models_post_post_model/LikedBy-class.html)
4.  toJson method

##### LikedBy class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
