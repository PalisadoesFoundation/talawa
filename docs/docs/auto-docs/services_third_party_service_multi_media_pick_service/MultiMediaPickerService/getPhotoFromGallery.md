::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/third_party_service/multi_media_pick_service.dart](../../services_third_party_service_multi_media_pick_service/)
3.  [MultiMediaPickerService](../../services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class.html)
4.  getPhotoFromGallery method

::: self-name
getPhotoFromGallery
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class-sidebar.html" below-sidebar=""}
<div>

# [getPhotoFromGallery]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)?]{.type-parameter}\>]{.signature}]{.returntype}
[getPhotoFromGallery]{.name}({

1.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [camera]{.parameter-name} = [false]{.default-value},
    ]{#getPhotoFromGallery-param-camera .parameter}

})
:::

::: {.section .desc .markdown}
Picks the image from gallery or to click the image from user\'s camera.

First ask for the permission to access the camera, if denied then
returns a message in. custom Dialog Box. Returns a File type for which
`camera` variable is false by default.

**params**:

-   `camera`: if true then open camera for image, else open gallery to
    select image.

**returns**:

-   `Future<File?>`: the image the user choosed.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<File?> getPhotoFromGallery({bool camera = false}) async {
  // asking for user's camera access permission.
  try {
    // checking for the image source, it could be camera or gallery.
    final image = await _picker.pickImage(
      source: camera ? ImageSource.camera : ImageSource.gallery,
    );
    // if image is selected or not null, call the cropImage function that provide service to crop the selected image.
    if (image != null) {
      return await _imageService.cropImage(
        imageFile: File(image.path),
      );
    }
  } catch (e) {
    // if the permission denied or error occurs.
    if (e is PlatformException && e.code == 'camera_access_denied') {
      // push the dialog alert with the message.
      locator<NavigationService>().pushDialog(
        permissionDeniedDialog(),
      );
    }
    debugPrint(
      "MultiMediaPickerService : Exception occurred while choosing photo from the gallery $e",
    );
  }

  return null;
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [multi_media_pick_service](../../services_third_party_service_multi_media_pick_service/)
3.  [MultiMediaPickerService](../../services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class.html)
4.  getPhotoFromGallery method

##### MultiMediaPickerService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
