


# customDatePicker function










[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)> customDatePicker
({required [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html) initialDate})





<p>Shows a dialog containing a Material Design date picker.</p>
<p>The returned Future resolves to the date selected by the user when the user confirms the dialog.
If the user cancels the dialog, null is returned.</p>



## Implementation

```dart
Future<DateTime> customDatePicker({required DateTime initialDate}) async {
  // showDatePicker which shows a material design date range picker used to select a range of dates.
  final DateTime? picked = await showDatePicker(
    context: navigationService.navigatorKey.currentContext!,
    initialDate: initialDate,
    firstDate: DateTime(2015, 8),
    lastDate: DateTime(2101),
  );
  if (picked != null && picked != initialDate) {
    return picked;
  }
  return initialDate;
}
```







