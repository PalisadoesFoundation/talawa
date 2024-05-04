


# refreshToken method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) refreshToken
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) refreshToken)








## Implementation

```dart
String refreshToken(String refreshToken) {
  return '''
      mutation{
        refreshToken(refreshToken: "$refreshToken"){
          accessToken
          refreshToken
        }
      }
  ''';
}
```







