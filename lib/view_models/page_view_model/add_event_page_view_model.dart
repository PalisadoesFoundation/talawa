import 'package:flutter/material.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/view_models/base_model.dart';

class AddEventPageViewModel extends BaseModel {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  bool _validateTitle = false,
      _validateDescription = false,
      _validateLocation = false;
  ApiFunctions _apiFunctions = ApiFunctions();
  String _recurrance = "DAILY";
  Map<String, bool> _switchVals = {
    'Make Public': true,
    'Make Registerable': true,
    'Recurring': true,
    'All Day': false
  };

  TextEditingController get titleController => _titleController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get locationController => _locationController;
  Map<String, DateTime> get startEndTimes => _startEndTimes;
  DateTimeRange get dateRange => _dateRange;
  bool get validateTitle => _validateTitle;
  bool get validateDescription => _validateDescription;
  bool get validateLocation => _validateLocation;

  setDateRange(DateTimeRange dR) {
    _dateRange = dR;
    notifyListeners();
  }

  setStartEndTime(String key, DateTime date) {
    _startEndTimes[key] = date;
    notifyListeners();
  }

  setRecurrance(String value) {
    _recurrance = value;
    notifyListeners();
  }

  setSwitchVals(String key, bool val) {
    _switchVals[key] = val;
    notifyListeners();
  }

  setValidateTitle(bool val) {
    _validateTitle = val;
    notifyListeners();
  }

  setValidateDescription(bool val) {
    _validateDescription = val;
    notifyListeners();
  }

  setValidateLocation(bool val) {
    _validateLocation = val;
    notifyListeners();
  }

  Map<String, bool> get switchVals => _switchVals;

  List<String> get recurranceList => ['DAILY', 'WEEKLY', 'MONTHLY', 'YEARLY'];
  String get recurrance => _recurrance;
  Preferences preferences = Preferences();

  //getting the date for the event
  DateTimeRange _dateRange = DateTimeRange(
      start: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 1, 0),
      end: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 1, 1, 0));

  //storing the start time of an event
  Map<String, DateTime> _startEndTimes = {
    'Start Time': DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0),
    'End Time': DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 23, 59),
  };

  //method to be called when the user wants to select the date
  Future<void> selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTimeRange picked = await showDateRangePicker(
        context: context,
        // initialDate: selectedDate,
        firstDate: DateTime(now.year, now.month, now.day),
        lastDate: DateTime(2101));
    if (picked != null && picked != _dateRange) {
      setDateRange(picked);
    }
  }

  //method to be called when the user wants to select time
  Future<void> selectTime(
      BuildContext context, String name, TimeOfDay time) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null && picked != time) {
      setStartEndTime(
          name,
          DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, picked.hour, picked.minute));
    }
  }

  //method used to create an event
  Future<void> createEvent() async {
    final DateTime startDate = DateTime(
        _dateRange.start.year, _dateRange.start.month, _dateRange.start.day);
    final DateTime endDate = DateTime(
        _dateRange.start.year, _dateRange.start.month, _dateRange.start.day);
    final DateTime startTime = DateTime(
        _dateRange.start.year,
        _dateRange.start.month,
        _dateRange.start.day,
        _startEndTimes['Start Time'].hour,
        _startEndTimes['Start Time'].minute);
    final DateTime endTime = DateTime(
        _dateRange.end.year,
        _dateRange.end.month,
        _dateRange.end.day,
        _startEndTimes['End Time'].hour,
        _startEndTimes['End Time'].minute);

    if (switchVals['All Day']) {
      _startEndTimes = {
        'Start Time': DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 12, 0),
        'End Time': DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 23, 59),
      };
    }
    final String currentOrgID = await preferences.getCurrentOrgId();
    var locationController;
    final result = await Queries().addEvent(
      startDate: startDate.toString(),
      endDate: endDate.toString(),
      organizationId: currentOrgID,
      title: _titleController.text,
      description: _descriptionController.text,
      location: _locationController.text,
      isPublic: _switchVals['Make Public'],
      isRegisterable: _switchVals['Make Registerable'],
      recurring: _switchVals['Recurring'],
      allDay: _switchVals['All Day'],
      recurrance: _recurrance,
      startTime: startTime.microsecondsSinceEpoch.toString(),
      endTime: endTime.microsecondsSinceEpoch.toString(),
    );
    print('Result is : $result');
    if (result == null) {
      CustomToast.exceptionToast(
          msg: "Could not create event! Please Try Again later!");
    }
  }
}
