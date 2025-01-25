




logout method - AppSettingViewModel class - app\_setting\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/settings\_view\_models/app\_setting\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_settings_view_models_app_setting_view_model/)
3. [AppSettingViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class.html)
4. logout method

logout


dark\_mode

light\_mode




# logout method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
logout()

This method destroys the user's session or sign out the user from app, The function asks for the confimation in Custom Alert Dialog.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> logout() async {
  // push custom alert dialog with the confirmation message.
  userConfig.userLogOut();
}
```

 


1. [talawa](../../index.html)
2. [app\_setting\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_settings_view_models_app_setting_view_model/)
3. [AppSettingViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class.html)
4. logout method

##### AppSettingViewModel class





talawa
1.0.0+1






