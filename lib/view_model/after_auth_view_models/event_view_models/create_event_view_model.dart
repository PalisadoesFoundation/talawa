import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/event_queries.dart';

import 'package:talawa/view_model/base_view_model.dart';

class CreateEventViewModel extends BaseModel {
  TextEditingController eventTitleTextController = TextEditingController();
  TextEditingController eventLocationTextController = TextEditingController();
  TextEditingController eventDescriptionTextController =
      TextEditingController();

  TimeOfDay eventStartTime = TimeOfDay.now();
  TimeOfDay eventEndTime = TimeOfDay.now();
  DateTime eventStartDate = DateTime.now();
  DateTime eventEndDate = DateTime.now();
  bool isPublicSwitch = true;
  bool isRegisterableSwitch = false;
  final _eventService = locator<EventService>();
  final _dbFunctions = locator<DataBaseMutationFunctions>();

  late OrgInfo _currentOrg;
  final _userConfig = locator<UserConfig>();

  initialize() {
    _currentOrg = _userConfig.currentOrg;
  }

  Future<void> createEvent() async {
    final DateTime startDate = eventStartDate;
    final DateTime endDate = eventStartDate;
    final DateTime startTime = DateTime(startDate.year, startDate.month,
        startDate.day, eventStartTime.hour, eventStartTime.minute);
    final DateTime endTime = DateTime(endDate.year, endDate.month, endDate.day,
        eventEndTime.hour, eventEndTime.minute);
    final Map<String, dynamic> variables = {
      'startDate': startDate.toString(),
      'endDate': endDate.toString(),
      'organizationId': _currentOrg.id!,
      'title': eventTitleTextController.text,
      'description': eventDescriptionTextController.text,
      'location': eventLocationTextController.text,
      'isPublic': isPublicSwitch,
      'isRegisterable': isRegisterableSwitch,
      'recurring': false,
      'allDay': false,
      'startTime': startTime.microsecondsSinceEpoch.toString(),
      'endTime': endTime.microsecondsSinceEpoch.toString(),
    };
    _dbFunctions.init();
    final result = await _dbFunctions.gqlmutation(EventQueries().addEvent(),
        variables: variables, showProgress: true);
    print('Result is : $result');
    if (result != null) {
      navigationService.pop();

      _eventService.getEvents();
    }
  }
}
