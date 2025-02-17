
<div>

# convertToBase64 method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]]
convertToBase64(

1.  [[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)]
    file]

)



This function is used to convert the image into Base64 format.

**params**:

-   `file`: Takes the image in format of file.

**returns**:

-   `Future<String>`: image in string format



## Implementation

``` language-dart
Future<String> convertToBase64(File file) async {
  try {
    base64Image = await imageService.convertToBase64(file);
    return base64Image!;
  } catch (error) {
    print(error);
    return '';
  }
}
```







1.  [talawa](../../index.html)
2.  [edit_profile_view_model](../../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/)
3.  [EditProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel-class.html)
4.  convertToBase64 method

##### EditProfilePageViewModel class







