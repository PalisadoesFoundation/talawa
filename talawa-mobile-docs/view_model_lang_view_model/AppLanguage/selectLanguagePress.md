


# selectLanguagePress method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> selectLanguagePress
()





<p>This function navigate user to <code>/appSettingsPage</code> route if the user is authenticated
else navigate to <code>/setUrl</code> route.</p>



## Implementation

```dart
Future<void> selectLanguagePress() async {
  final bool userLoggedIn = await userConfig.userLoggedIn();
  if (userLoggedIn) {
    dbLanguageUpdate();
    navigationService.popAndPushScreen('/appSettingsPage', arguments: '');
  } else {
    navigationService.pushScreen('/setUrl', arguments: '');
  }
}
```







