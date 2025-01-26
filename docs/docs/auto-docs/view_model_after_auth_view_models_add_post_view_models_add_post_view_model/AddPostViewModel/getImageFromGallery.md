::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/add_post_view_models/add_post_view_model.dart](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3.  [AddPostViewModel](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.html)
4.  getImageFromGallery method

::: self-name
getImageFromGallery
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [getImageFromGallery]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[getImageFromGallery]{.name}({

1.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [camera]{.parameter-name} = [false]{.default-value},
    ]{#getImageFromGallery-param-camera .parameter}

})
:::

::: {.section .desc .markdown}
This function is used to get the image from gallery.

The function uses the `_multiMediaPickerService` services.

**params**:

-   `camera`: if true then open camera for image, else open gallery to
    select image.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> getImageFromGallery({bool camera = false}) async {
  final image =
      await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
  // convertImageToBase64(image!.path);
  if (image != null) {
    _imageFile = image;
    // convertImageToBase64(image.path);
    _imageInBase64 = await _imageService.convertToBase64(image);
    // print(_imageInBase64);
    _navigationService.showTalawaErrorSnackBar(
      "Image is added",
      MessageType.info,
    );
    notifyListeners();
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [add_post_view_model](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3.  [AddPostViewModel](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.html)
4.  getImageFromGallery method

##### AddPostViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
