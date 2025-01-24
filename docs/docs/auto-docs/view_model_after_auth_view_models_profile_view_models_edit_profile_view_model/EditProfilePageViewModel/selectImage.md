




selectImage method - EditProfilePageViewModel class - edit\_profile\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/profile\_view\_models/edit\_profile\_view\_model.dart](../../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/view_model_after_auth_view_models_profile_view_models_edit_profile_view_model-library.html)
3. [EditProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel-class.html)
4. selectImage method

selectImage


dark\_mode

light\_mode




# selectImage method


Future<void>
selectImage({

1. bool camera = false,

})

This function is used to get the image from gallery.

The function uses the `_multiMediaPickerService` services.

**params**:

* `camera`: if true then open camera for image, else open gallery to select image.

**returns**:
None


## Implementation

```
Future<void> selectImage({bool camera = false}) async {
  final image =
      await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
  if (image != null) {
    imageFile = image;
    notifyListeners();
  }
}
```

 


1. [talawa](../../index.html)
2. [edit\_profile\_view\_model](../../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/view_model_after_auth_view_models_profile_view_models_edit_profile_view_model-library.html)
3. [EditProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel-class.html)
4. selectImage method

##### EditProfilePageViewModel class





talawa
1.0.0+1






