
<div>

# translate method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
translate(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)?]
    key]

)



## Implementation

``` language-dart
String? translate(String? key) {
  if (isTest) return key;

  // ignore: unnecessary_null_comparison
  if (key == null) {
    return '...';
  }
  return _localizedStrings[key];
}
```







1.  [talawa](../../index.md)
2.  [app_localization](../../utils_app_localization/)
3.  [AppLocalizations](../../utils_app_localization/AppLocalizations-class.md)
4.  translate method

##### AppLocalizations class







