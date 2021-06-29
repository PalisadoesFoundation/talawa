import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';

Future<DateTime> customDatePicker({required DateTime initialDate}) async {
  final DateTime? _picked = await showDatePicker(
      context: navigationService.navigatorKey.currentContext!,
      initialDate: initialDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101));
  if (_picked != null && _picked != initialDate) {
    return _picked;
  }
  return initialDate;
}

Future<TimeOfDay> customTimePicker({required TimeOfDay initialTime}) async {
  final TimeOfDay? _pickedTime = await showTimePicker(
      context: navigationService.navigatorKey.currentContext!,
      initialTime: initialTime);

  if (_pickedTime != null && _pickedTime != initialTime) {
    return _pickedTime;
  }
  return initialTime;
}
