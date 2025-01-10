


# showTalawaErrorDialog method








void showTalawaErrorDialog
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) errorMessage, [MessageType](../../enums_enums/MessageType.md) messageType)








## Implementation

```dart
void showTalawaErrorDialog(String errorMessage, MessageType messageType) {
  showDialog(
    context: navigatorKey.currentContext!,
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return TalawaErrorDialog(
        errorMessage,
        messageType: messageType,
      );
    },
  );
}
```







