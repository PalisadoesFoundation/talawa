


# getToken method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) getToken
()





<p>This function is used to get user the access token.</p>



## Implementation

```dart
Future getToken() async {
  final authToken = userConfig.currentUser.authToken;
  token = authToken;
  getOrgUrl();
  return true;
}
```







