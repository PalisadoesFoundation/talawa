
<div>

# strictTranslate method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
strictTranslate(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    key]

)



## Implementation

``` language-dart
String strictTranslate(String key) {
  if (isTest) return key;

  // ignore: unnecessary_null_comparison
  if (key == null) {
    return '...';
  }

  final String translate = _localizedStrings[key] ?? key;
  return translate;
}
```







1.  [talawa](../../index.md)
2.  [app_localization](../../utils_app_localization/)
3.  [AppLocalizations](../../utils_app_localization/AppLocalizations-class.md)
4.  strictTranslate method

##### AppLocalizations class







