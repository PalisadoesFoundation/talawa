


# customTimePicker function










[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)> customTimePicker
({required [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html) initialTime})





<p>Shows a dialog containing a material design time picker.</p>
<p>The returned Future resolves to the time selected by the user when the user closes the dialog.
If the user cancels the dialog, null is returned.</p>



## Implementation

```dart
Future<TimeOfDay> customTimePicker({required TimeOfDay initialTime}) async {
  // showTimePicker which shows a material design time range picker used to select a range of times.
  // Click ![here](https://api.flutter.dev/flutter/material/showTimePicker.html) to know more.
  final TimeOfDay? pickedTime = await showTimePicker(
    context: navigationService.navigatorKey.currentContext!,
    initialTime: initialTime,
  );

  if (pickedTime != null && pickedTime != initialTime) {
    return pickedTime;
  }
  return initialTime;
}
```







