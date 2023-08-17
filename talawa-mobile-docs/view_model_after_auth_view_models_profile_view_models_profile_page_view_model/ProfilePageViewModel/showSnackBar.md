


# showSnackBar method








void showSnackBar
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) message)








## Implementation

```dart
void showSnackBar(String message) {
  _navigationService.showTalawaErrorDialog(message, MessageType.error);
}
```







