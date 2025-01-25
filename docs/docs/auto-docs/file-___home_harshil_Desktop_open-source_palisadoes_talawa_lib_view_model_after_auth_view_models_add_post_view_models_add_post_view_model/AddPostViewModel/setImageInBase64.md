




setImageInBase64 method - AddPostViewModel class - add\_post\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/add\_post\_view\_models/add\_post\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3. [AddPostViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.html)
4. setImageInBase64 method

setImageInBase64


dark\_mode

light\_mode




# setImageInBase64 method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
setImageInBase64(

1. [File](https://api.flutter.dev/flutter/dart-io/File-class.html) file

)

Method to set Image in Bsse64.

**params**:

* `file`: The file to convert.

**returns**:
None


## Implementation

```
Future<void> setImageInBase64(File file) async {
  _imageInBase64 = await _imageService.convertToBase64(file);
  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [add\_post\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3. [AddPostViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.html)
4. setImageInBase64 method

##### AddPostViewModel class





talawa
1.0.0+1






