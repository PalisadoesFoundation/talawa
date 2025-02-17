::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [toggleIsLiked]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [toggleIsLiked]{.name}()
:::

::: {.section .desc .markdown}
function to toggleisLiked boolean.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void toggleIsLiked() {
  if (!_isLiked) {
    _postService.addLike(_postID);
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [like_button_view_model](../../view_model_widgets_view_models_like_button_view_model/)
3.  [LikeButtonViewModel](../../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4.  toggleIsLiked method

##### LikeButtonViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
