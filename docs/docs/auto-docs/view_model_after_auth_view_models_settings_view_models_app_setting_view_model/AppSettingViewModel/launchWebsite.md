




launchWebsite method - AppSettingViewModel class - app\_setting\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/settings\_view\_models/app\_setting\_view\_model.dart](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/view_model_after_auth_view_models_settings_view_models_app_setting_view_model-library.html)
3. [AppSettingViewModel](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class.html)
4. launchWebsite method

launchWebsite


dark\_mode

light\_mode




# launchWebsite method


Future<bool>
launchWebsite(

1. String url

)

Launches a website using the provided URL.

**params**:

* `url`: A `String` representing the URL of the website to be launched.

**returns**:

* `Future<bool>`: A `Future` that resolves to a `bool` value indicating
  whether the website launch was successful.

## Implementation

```
Future<bool> launchWebsite(String url) async => await launchUrlString(url);
```

 


1. [talawa](../../index.html)
2. [app\_setting\_view\_model](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/view_model_after_auth_view_models_settings_view_models_app_setting_view_model-library.html)
3. [AppSettingViewModel](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class.html)
4. launchWebsite method

##### AppSettingViewModel class





talawa
1.0.0+1






