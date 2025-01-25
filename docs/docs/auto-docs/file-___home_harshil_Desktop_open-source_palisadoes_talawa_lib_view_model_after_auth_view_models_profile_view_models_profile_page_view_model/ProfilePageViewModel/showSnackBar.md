




showSnackBar method - ProfilePageViewModel class - profile\_page\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/profile\_view\_models/profile\_page\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3. [ProfilePageViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4. showSnackBar method

showSnackBar


dark\_mode

light\_mode




# showSnackBar method


void
showSnackBar(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) message

)

show message on Snack Bar.

**params**:

* `message`: String Message to show on snackbar

**returns**:
None


## Implementation

```
void showSnackBar(String message) {
  _navigationService.showTalawaErrorDialog(message, MessageType.error);
}
```

 


1. [talawa](../../index.html)
2. [profile\_page\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3. [ProfilePageViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4. showSnackBar method

##### ProfilePageViewModel class





talawa
1.0.0+1






