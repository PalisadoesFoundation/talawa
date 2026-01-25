<<<<<<< HEAD
// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

=======
>>>>>>> upstream/develop
import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';

/// Shows a dialog containing a Material Design date picker.
///
<<<<<<< HEAD
/// The returned Future resolves to the date selected by the user when the user confirms the dialog.
/// If the user cancels the dialog, null is returned.
=======
/// **params**:
/// * `initialDate`: The initially selected date that the picker will show.
///
/// **returns**:
/// * `Future<DateTime>`: Resolves to the date selected by the user. If the user cancels the dialog or picks the same `initialDate`, the function returns `initialDate`.
>>>>>>> upstream/develop
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

<<<<<<< HEAD
/// Shows a dialog containing a material design time picker.
///
/// The returned Future resolves to the time selected by the user when the user closes the dialog.
/// If the user cancels the dialog, null is returned.
=======
/// Shows a dialog containing a Material Design time picker.
///
/// **params**:
/// * `initialTime`: The initially selected time that the picker will show.
///
/// **returns**:
/// * `Future<TimeOfDay>`: Resolves to the time chosen by the user. If the user cancels or picks the same `initialTime`, the function returns `initialTime`.
>>>>>>> upstream/develop
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
