
<div>

# getImageFromGallery method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
getImageFromGallery({

1.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.md)]
    camera = false,
    ]

})



This function is used to get the image from gallery.

The function uses the `_multiMediaPickerService` services.

**params**:

-   `camera`: if true then open camera for image, else open gallery to
    select image.

**returns**: None



## Implementation

``` language-dart
Future<void> getImageFromGallery({bool camera = false}) async {
  final image =
      await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
  if (image != null) {
    _imageFile = image;
    ;
  }
}
```







1.  [talawa](../../index.md)
2.  [create_event_view_model](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.md)
4.  getImageFromGallery method

##### CreateEventViewModel class







