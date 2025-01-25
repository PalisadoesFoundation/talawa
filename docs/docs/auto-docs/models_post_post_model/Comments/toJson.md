::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/post/post_model.dart](../../models_post_post_model/)
3.  [Comments](../../models_post_post_model/Comments-class.html)
4.  toJson method

::: self-name
toJson
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_post_post_model/Comments-class-sidebar.html" below-sidebar=""}
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
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_model](../../models_post_post_model/)
3.  [Comments](../../models_post_post_model/Comments-class.html)
4.  toJson method

##### Comments class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
