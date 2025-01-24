




translate method - AppLocalizations class - app\_localization library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/app\_localization.dart](../../utils_app_localization/utils_app_localization-library.html)
3. [AppLocalizations](../../utils_app_localization/AppLocalizations-class.html)
4. translate method

translate


dark\_mode

light\_mode




# translate method


String?
translate(

1. String? key

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
2. [app\_localization](../../utils_app_localization/utils_app_localization-library.html)
3. [AppLocalizations](../../utils_app_localization/AppLocalizations-class.html)
4. translate method

##### AppLocalizations class





talawa
1.0.0+1






