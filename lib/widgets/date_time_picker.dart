import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';

/// Shows a dialog containing a Material Design date picker.
///
/// **params**:
/// * `initialDate`: The initially selected date that the picker will show.
///
/// **returns**:
/// * `Future<DateTime>`: Resolves to the date selected by the user. If the user cancels the dialog or picks the same `initialDate`, the function returns `initialDate`.
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

/// Shows a dialog containing a Material Design time picker.
///
/// **params**:
/// * `initialTime`: The initially selected time that the picker will show.
///
/// **returns**:
/// * `Future<TimeOfDay>`: Resolves to the time chosen by the user. If the user cancels or picks the same `initialTime`, the function returns `initialTime`.
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
