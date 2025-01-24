




logout method - AppSettingViewModel class - app\_setting\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/settings\_view\_models/app\_setting\_view\_model.dart](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/view_model_after_auth_view_models_settings_view_models_app_setting_view_model-library.html)
3. [AppSettingViewModel](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class.html)
4. logout method

logout


dark\_mode

light\_mode




# logout method


Future<void>
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
2. [app\_setting\_view\_model](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/view_model_after_auth_view_models_settings_view_models_app_setting_view_model-library.html)
3. [AppSettingViewModel](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class.html)
4. logout method

##### AppSettingViewModel class





talawa
1.0.0+1






