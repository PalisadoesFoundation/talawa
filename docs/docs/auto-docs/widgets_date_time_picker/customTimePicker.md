
<div>

# customTimePicker function

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]\>]]
customTimePicker({

1.  [required
    [[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.md)]
    initialTime,
    ]

})



Shows a dialog containing a material design time picker.

The returned Future resolves to the time selected by the user when the
user closes the dialog. If the user cancels the dialog, null is
returned.



## Implementation

``` language-dart
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







1.  [talawa](../index.md)
2.  [date_time_picker](../widgets_date_time_picker/)
3.  customTimePicker function

##### date_time_picker library







