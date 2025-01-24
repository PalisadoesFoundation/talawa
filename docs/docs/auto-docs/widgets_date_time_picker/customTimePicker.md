




customTimePicker function - date\_time\_picker library - Dart API







menu

1. [talawa](../index.html)
2. [widgets/date\_time\_picker.dart](../widgets_date_time_picker/widgets_date_time_picker-library.html)
3. customTimePicker function

customTimePicker


dark\_mode

light\_mode




# customTimePicker function


Future<[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)>
customTimePicker({

1. required [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html) initialTime,

})

Shows a dialog containing a material design time picker.

The returned Future resolves to the time selected by the user when the user closes the dialog.
If the user cancels the dialog, null is returned.


## Implementation

```
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

 


1. [talawa](../index.html)
2. [date\_time\_picker](../widgets_date_time_picker/widgets_date_time_picker-library.html)
3. customTimePicker function

##### date\_time\_picker library





talawa
1.0.0+1






