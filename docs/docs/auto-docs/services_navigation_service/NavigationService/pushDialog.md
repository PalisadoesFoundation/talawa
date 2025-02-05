


# pushDialog method








void pushDialog
([Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) dialog)





<p>This function is used to show the custom Dialog.</p>



## Implementation

```dart
void pushDialog(Widget dialog) {
  showDialog(
    context: navigatorKey.currentContext!,
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}
```







