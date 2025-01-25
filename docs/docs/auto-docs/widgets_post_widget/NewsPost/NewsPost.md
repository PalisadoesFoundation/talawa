::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [widgets/post_widget.dart](../../widgets_post_widget/)
3.  [NewsPost](../../widgets_post_widget/NewsPost-class.html)
4.  NewsPost const constructor

::: self-name
NewsPost
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="widgets_post_widget/NewsPost-class-sidebar.html" below-sidebar=""}
<div>

# [NewsPost]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
const [NewsPost]{.name}({

1.  [[[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?]{.type-annotation}
    [key]{.parameter-name}, ]{#-param-key .parameter}
2.  [required
    [[Post](../../models_post_post_model/Post-class.html)]{.type-annotation}
    [post]{.parameter-name}, ]{#-param-post .parameter}
3.  [[dynamic]{.type-annotation}
    [function]{.parameter-name}(]{#-param-function .parameter}
    1.  [[[Post](../../models_post_post_model/Post-class.html)]{.type-annotation}]{#param-
        .parameter}

    )?,
4.  [[dynamic]{.type-annotation}
    [deletePost]{.parameter-name}(]{#-param-deletePost .parameter}
    1.  [[[Post](../../models_post_post_model/Post-class.html)]{.type-annotation}]{#param-
        .parameter}

    )?,

})
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
const NewsPost({
  super.key,
  required this.post,
  this.function,
  this.deletePost,
});
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_widget](../../widgets_post_widget/)
3.  [NewsPost](../../widgets_post_widget/NewsPost-class.html)
4.  NewsPost const constructor

##### NewsPost class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
