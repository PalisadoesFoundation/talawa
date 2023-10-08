


# CustomAlertDialog constructor






const
CustomAlertDialog({[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? successText, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? dialogTitle, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) reverse = false, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) secondaryButtonText = 'Close', [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html)? secondaryButtonTap, required [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html) success, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) dialogSubTitle})





## Implementation

```dart
const CustomAlertDialog({
  Key? key,
  this.successText,
  this.dialogTitle,
  this.reverse = false,
  this.secondaryButtonText = 'Close',
  this.secondaryButtonTap,
  required this.success,
  required this.dialogSubTitle,
}) : super(key: key);
```







