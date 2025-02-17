
<div>

# customDatePicker function

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]\>]]
customDatePicker({

1.  [required
    [[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]
    initialDate,
    ]

})



Shows a dialog containing a Material Design date picker.

The returned Future resolves to the date selected by the user when the
user confirms the dialog. If the user cancels the dialog, null is
returned.



## Implementation

``` language-dart
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







1.  [talawa](../index.html)
2.  [date_time_picker](../widgets_date_time_picker/)
3.  customDatePicker function

##### date_time_picker library







