::::::: {#dartdoc-main-content .main-content above-sidebar="services_image_service/ImageService-class-sidebar.html" below-sidebar=""}
<div>

# [cropImage]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)?]{.type-parameter}\>]{.signature}]{.returntype}
[cropImage]{.name}({

1.  [required
    [[File](https://api.flutter.dev/flutter/dart-io/File-class.html)]{.type-annotation}
    [imageFile]{.parameter-name}, ]{#cropImage-param-imageFile
    .parameter}

})
:::

::: {.section .desc .markdown}
Crops the image selected by the user.

**params**:

-   `imageFile`: the image file to be cropped.

**returns**:

-   `Future<File?>`: the image after been cropped.

**throws**:

-   `Exception`: If an error occurs during the image cropping process.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<File?> cropImage({required File imageFile}) async {
  // try, to crop the image and returns a File with cropped image path.
  try {
    final CroppedFile? croppedImage = await _imageCropper.cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: const Color(0xff18191A),
          toolbarWidgetColor: Colors.white,
          backgroundColor: Colors.black,
          cropGridColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          cropStyle: CropStyle.rectangle,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
          ],
        ),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
          ],
        ),
      ],
    );

    if (croppedImage != null) {
      return File(croppedImage.path);
    }
  } catch (e) {
    throw Exception(
      "ImageService : $e.",
    );
  }

  return null;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [image_service](../../services_image_service/)
3.  [ImageService](../../services_image_service/ImageService-class.html)
4.  cropImage method

##### ImageService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
