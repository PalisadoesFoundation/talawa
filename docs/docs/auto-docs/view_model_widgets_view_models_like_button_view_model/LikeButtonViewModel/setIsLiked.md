::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/widgets_view_models/like_button_view_model.dart](../../view_model_widgets_view_models_like_button_view_model/)
3.  [LikeButtonViewModel](../../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4.  setIsLiked method

::: self-name
setIsLiked
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [setIsLiked]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [setIsLiked]{.name}({

1.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [val]{.parameter-name} = [true]{.default-value},
    ]{#setIsLiked-param-val .parameter}

})
:::

::: {.section .desc .markdown}
function to set isLiked boolean.

**params**:

-   `val`: value to set bool to.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void setIsLiked({bool val = true}) {
  _isLiked = val;
  notifyListeners();
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [like_button_view_model](../../view_model_widgets_view_models_like_button_view_model/)
3.  [LikeButtonViewModel](../../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4.  setIsLiked method

##### LikeButtonViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
