<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/third_party_service/multi_media_pick_service.dart](../../services_third_party_service_multi_media_pick_service/)
3.  [MultiMediaPickerService](../../services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class.md)
4.  getPhotoFromGallery method

<div class="self-name">

getPhotoFromGallery

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">getPhotoFromGallery</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[File](https://api.flutter.dev/flutter/dart-io/File-class.html)?</span>\></span></span>
<span class="name">getPhotoFromGallery</span>

</div>

<div class="section desc markdown">

Picks the image from gallery or to click the image from user's camera.

First ask for the permission to access the camera, if denied then
returns a message in. custom Dialog Box. Returns a File type for which
`camera` variable is false by default.

**params**:

- `camera`: if true then open camera for image, else open gallery to
  select image.

**returns**:

- `Future<File?>`: the image the user choosed.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<File?>  async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [multi_media_pick_service](../../services_third_party_service_multi_media_pick_service/)
3.  [MultiMediaPickerService](../../services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class.md)
4.  getPhotoFromGallery method

##### MultiMediaPickerService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
