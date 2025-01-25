




getImageFromGallery method - AddPostViewModel class - add\_post\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/add\_post\_view\_models/add\_post\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3. [AddPostViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.html)
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

 


1. [talawa](../../index.html)
2. [add\_post\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3. [AddPostViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.html)
4. getImageFromGallery method

##### AddPostViewModel class





talawa
1.0.0+1






