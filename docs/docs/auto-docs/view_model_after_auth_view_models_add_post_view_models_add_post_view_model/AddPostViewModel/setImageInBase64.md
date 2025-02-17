
<div>

# setImageInBase64 method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
setImageInBase64(

1.  [[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)]
    file]

)



Method to set Image in Bsse64.

**params**:

-   `file`: The file to convert.

**returns**: None



## Implementation

``` language-dart
Future<void> setImageInBase64(File file) async {
  _imageInBase64 = await _imageService.convertToBase64(file);
  ;
}
```







1.  [talawa](../../index.html)
2.  [add_post_view_model](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3.  [AddPostViewModel](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.html)
4.  setImageInBase64 method

##### AddPostViewModel class







