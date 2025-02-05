


# newUserLanguage method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) newUserLanguage
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) userId)








## Implementation

```dart
String newUserLanguage(String userId) {
  return '''
  query{
    userLanguage(userId:"$userId")
  }
''';
}
```







