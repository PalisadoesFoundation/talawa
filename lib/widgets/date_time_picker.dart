import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';

/// Shows a dialog containing a Material Design date picker.
///
/// The returned Future resolves to the date selected by the user when the user confirms the dialog.
/// If the user cancels the dialog, null is returned.
Future<DateTime> customDatePicker({required DateTime initialDate}) async {
  // showDatePicker which shows a material design date range picker used to select a range of dates.
  final DateTime? _picked = await showDatePicker(
    context: navigationService.navigatorKey.currentContext!,
    initialDate: initialDate,
    firstDate: DateTime(2015, 8),
    lastDate: DateTime(2101),
  );
  if (_picked != null && _picked != initialDate) {
    return _picked;
  }
  return initialDate;
}

/// Shows a dialog containing a material design time picker.
///
/// The returned Future resolves to the time selected by the user when the user closes the dialog.
/// If the user cancels the dialog, null is returned.
Future<TimeOfDay> customTimePicker({required TimeOfDay initialTime}) async {
  // showTimePicker which shows a material design time range picker used to select a range of times.
  // Click ![here](https://api.flutter.dev/flutter/material/showTimePicker.html) to know more.
  final TimeOfDay? _pickedTime = await showTimePicker(
    context: navigationService.navigatorKey.currentContext!,
    initialTime: initialTime,
  );

  if (_pickedTime != null && _pickedTime != initialTime) {
    return _pickedTime;
  }
  return initialTime;
}
