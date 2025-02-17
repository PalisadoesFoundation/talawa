::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [checkAndSetTheIsLiked]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [checkAndSetTheIsLiked]{.name}()
:::

::: {.section .desc .markdown}
function to set isLiked boolean and check.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void checkAndSetTheIsLiked() {
  setIsLiked(val: false);
  for (var i = 0; i < _likedBy.length; i++) {
    if (_likedBy[i].sId == _user.id) {
      setIsLiked();
    }
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
4.  checkAndSetTheIsLiked method

##### LikeButtonViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
