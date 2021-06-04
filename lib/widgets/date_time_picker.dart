import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';

Future<DateTime> customDatePicker({required DateTime initialDate}) async {
  final DateTime? _picked = await showDatePicker(
      context: locator<NavigationService>().navigatorKey.currentContext!,
      initialDate: initialDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101));
  if (_picked != null && _picked != initialDate) {
    return _picked;
  }
  return initialDate;
}

Future<TimeOfDay> customTimePicker({required TimeOfDay initialTime}) async {
  final TimeOfDay? _pickedtime = await showTimePicker(
      context: locator<NavigationService>().navigatorKey.currentContext!,
      initialTime: initialTime);

  if (_pickedtime != null && _pickedtime != initialTime) {
    return _pickedtime;
  }
  return initialTime;
}
