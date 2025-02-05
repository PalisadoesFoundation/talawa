


# showSnackBar method








void showSnackBar
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) message, \{[Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html) duration = const Duration(seconds: 2)\})





<p>This is used for the quick alert of ```dartduration: 2 seconds``` with text message(passed).</p>



## Implementation

```dart
void showSnackBar(
  String message, \{
  Duration duration = const Duration(seconds: 2),
\}) \{
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: duration,
      content: Text(message),
    ),
  );
\}
```







