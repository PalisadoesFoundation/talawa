


# updateLanguage method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) updateLanguage
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) languageCode)








## Implementation

```dart
String updateLanguage(String languageCode) {
  return '''
      mutation {
        updateLanguage(languageCode: "$languageCode"){
          _id
          firstName
          appLanguageCode
        }
      }
  ''';
}
```







