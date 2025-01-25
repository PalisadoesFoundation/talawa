




launchWebsite method - AppSettingViewModel class - app\_setting\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/settings\_view\_models/app\_setting\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_settings_view_models_app_setting_view_model/)
3. [AppSettingViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class.html)
4. launchWebsite method

launchWebsite


dark\_mode

light\_mode




# launchWebsite method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>
launchWebsite(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) url

)

Launches a website using the provided URL.

**params**:

* `url`: A [String](https://api.flutter.dev/flutter/dart-core/String-class.html) representing the URL of the website to be launched.

**returns**:

* `Future<bool>`: A [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html) that resolves to a [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) value indicating
  whether the website launch was successful.

## Implementation

```
Future<bool> launchWebsite(String url) async => await launchUrlString(url);
```

 


1. [talawa](../../index.html)
2. [app\_setting\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_settings_view_models_app_setting_view_model/)
3. [AppSettingViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class.html)
4. launchWebsite method

##### AppSettingViewModel class





talawa
1.0.0+1






