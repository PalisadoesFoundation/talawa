




customDatePicker function - date\_time\_picker library - Dart API







menu

1. [talawa](../index.html)
2. [widgets/date\_time\_picker.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_date_time_picker/)
3. customDatePicker function

customDatePicker


dark\_mode

light\_mode




# customDatePicker function


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)>
customDatePicker({

1. required [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html) initialDate,

})

Shows a dialog containing a Material Design date picker.

The returned Future resolves to the date selected by the user when the user confirms the dialog.
If the user cancels the dialog, null is returned.


## Implementation

```
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

 


1. [talawa](../index.html)
2. [date\_time\_picker](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_date_time_picker/)
3. customDatePicker function

##### date\_time\_picker library





talawa
1.0.0+1






