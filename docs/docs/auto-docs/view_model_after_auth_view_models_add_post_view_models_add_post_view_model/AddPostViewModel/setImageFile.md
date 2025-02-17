::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [setImageFile]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [setImageFile]{.name}(

1.  [[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)?]{.type-annotation}
    [file]{.parameter-name}]{#setImageFile-param-file .parameter}

)
:::

::: {.section .desc .markdown}
Method to set image.

**params**:

-   `file`: The file to set

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void setImageFile(File? file) {
  _imageFile = file;
  notifyListeners();
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [add_post_view_model](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3.  [AddPostViewModel](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.html)
4.  setImageFile method

##### AddPostViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
