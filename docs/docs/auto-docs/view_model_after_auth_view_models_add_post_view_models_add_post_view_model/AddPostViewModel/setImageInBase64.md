::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [setImageInBase64]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[setImageInBase64]{.name}(

1.  [[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)]{.type-annotation}
    [file]{.parameter-name}]{#setImageInBase64-param-file .parameter}

)
:::

::: {.section .desc .markdown}
Method to set Image in Bsse64.

**params**:

-   `file`: The file to convert.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> setImageInBase64(File file) async {
  _imageInBase64 = await _imageService.convertToBase64(file);
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
4.  setImageInBase64 method

##### AddPostViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
