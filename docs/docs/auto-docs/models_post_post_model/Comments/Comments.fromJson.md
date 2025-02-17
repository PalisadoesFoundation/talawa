::::::: {#dartdoc-main-content .main-content above-sidebar="models_post_post_model/Comments-class-sidebar.html" below-sidebar=""}
<div>

# [Comments.fromJson]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[Comments.fromJson]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [json]{.parameter-name}]{#fromJson-param-json .parameter}

)
:::

::: {.section .desc .markdown}
Convert json to dart object.

params: None returns:

-   `Map<String, dynamic>`: Dart object is returned.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Comments.fromJson(Map<String, dynamic> json) {
  sId = json['_id'] as String?;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_model](../../models_post_post_model/)
3.  [Comments](../../models_post_post_model/Comments-class.html)
4.  Comments.fromJson constructor

##### Comments class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
