




getImageFromGallery method - CreateEventViewModel class - create\_event\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/create\_event\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3. [CreateEventViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4. getImageFromGallery method

getImageFromGallery


dark\_mode

light\_mode




# getImageFromGallery method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
getImageFromGallery({

1. [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) camera = false,

})

This function is used to get the image from gallery.

The function uses the `_multiMediaPickerService` services.

**params**:

* `camera`: if true then open camera for image, else open gallery to select image.

**returns**:
None


## Implementation

```
Future<void> getImageFromGallery({bool camera = false}) async {
  final image =
      await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
  if (image != null) {
    _imageFile = image;
    notifyListeners();
  }
}
```

 


1. [talawa](../../index.html)
2. [create\_event\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3. [CreateEventViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4. getImageFromGallery method

##### CreateEventViewModel class





talawa
1.0.0+1






