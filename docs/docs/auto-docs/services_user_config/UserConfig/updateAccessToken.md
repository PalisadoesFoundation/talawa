


# updateAccessToken method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) updateAccessToken
({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) accessToken, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) refreshToken})





<p>This function is used to updated the access token of the user.</p>
<p>params:</p>
<ul>
<li><code>accessToken</code></li>
<li><code>refreshToken</code></li>
</ul>



## Implementation

```dart
Future updateAccessToken({
  required String accessToken,
  required String refreshToken,
}) async {
  _currentUser!.refreshToken = refreshToken;
  _currentUser!.authToken = accessToken;
  saveUserInHive();
}
```







