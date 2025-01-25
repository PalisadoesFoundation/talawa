




translate method - AppLocalizations class - app\_localization library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/app\_localization.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/)
3. [AppLocalizations](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/AppLocalizations-class.html)
4. translate method

translate


dark\_mode

light\_mode




# translate method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?
translate(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? key

)

## Implementation

```
String? translate(String? key) {
  if (isTest) return key;

  // ignore: unnecessary_null_comparison
  if (key == null) {
    return '...';
  }
  return _localizedStrings[key];
}
```

 


1. [talawa](../../index.html)
2. [app\_localization](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/)
3. [AppLocalizations](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/AppLocalizations-class.html)
4. translate method

##### AppLocalizations class





talawa
1.0.0+1






