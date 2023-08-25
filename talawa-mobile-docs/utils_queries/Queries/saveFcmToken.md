


# saveFcmToken method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) saveFcmToken
([String](https://api.flutter.dev/flutter/dart-core/String-class.html)? token)








## Implementation

```dart
String saveFcmToken(String? token) {
  return """
      mutation {
        saveFcmToken(token: "$token")
      }
  """;
}
```







