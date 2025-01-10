


# showTalawaErrorSnackBar method








void showTalawaErrorSnackBar
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) errorMessage, [MessageType](../../enums_enums/MessageType.md) messageType, {[Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html) duration = const Duration(seconds: 2)})








## Implementation

```dart
void showTalawaErrorSnackBar(
  String errorMessage,
  MessageType messageType, {
  Duration duration = const Duration(seconds: 2),
}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      padding: EdgeInsets.zero,
      content: TalawaErrorSnackBar(
        messageType: messageType,
        errorMessage: errorMessage,
      ),
      backgroundColor: const Color.fromRGBO(65, 65, 66, 1),
    ),
  );
}
```







