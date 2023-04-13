// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// EditEventViewModel class have methods to interact with model in
/// the context of editing the event in the organization.
///
/// Methods include:
/// * `updateEvent` : to update an event.
class EditEventViewModel extends BaseModel {
  late Event _event;
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
  FocusNode titleFocus = FocusNode();
  FocusNode locationFocus = FocusNode();
  FocusNode descriptionFocus = FocusNode();

  final formKey = GlobalKey<FormState>();

  final _eventService = locator<EventService>();
  AutovalidateMode validate = AutovalidateMode.disabled;

  // initialiser, invoke `_fillEditForm` function.
  void initialize(Event event) {
    _event = event;
    _fillEditForm();
  }

  /// This function initialises the controller with the data.
  void _fillEditForm() {
    eventTitleTextController.text = _event.title!;
    eventLocationTextController.text = _event.location!;
    eventDescriptionTextController.text = _event.description!;
    isPublicSwitch = _event.isPublic!;
    isRegisterableSwitch = _event.isRegisterable!;
    eventStartDate = DateFormat().add_yMd().parse(_event.startDate!);
    eventEndDate = DateFormat().add_yMd().parse(_event.endDate!);
    eventStartTime =
        TimeOfDay.fromDateTime(DateFormat("h:mm a").parse(_event.startTime!));
    eventEndTime =
        TimeOfDay.fromDateTime(DateFormat("h:mm a").parse(_event.endTime!));
  }

  /// This function is used to update an event.
  /// The function uses `editEvent` function provided by `eventService` service.
  Future<void> updateEvent() async {
    titleFocus.unfocus();
    locationFocus.unfocus();
    descriptionFocus.unfocus();
    validate = AutovalidateMode.always;
    if (formKey.currentState!.validate()) {
      validate = AutovalidateMode.disabled;
      final DateTime startTime = DateTime(
        eventStartDate.year,
        eventStartDate.month,
        eventStartDate.day,
        eventStartTime.hour,
        eventStartTime.minute,
      );
      final DateTime endTime = DateTime(
        eventEndDate.year,
        eventEndDate.month,
        eventEndDate.day,
        eventEndTime.hour,
        eventEndTime.minute,
      );
      // map for the required data to update an event.
      final Map<String, dynamic> variables = {
        'title': eventTitleTextController.text,
        'description': eventDescriptionTextController.text,
        'location': eventLocationTextController.text,
        'isPublic': isPublicSwitch,
        'isRegisterable': isRegisterableSwitch,
        'recurring': false,
        'allDay': false,
        'startDate': DateFormat('yyyy-MM-dd').format(eventStartDate),
        'endDate': DateFormat('yyyy-MM-dd').format(eventEndDate),
        'startTime': '${DateFormat('HH:mm:ss').format(startTime)}Z',
        'endTime': '${DateFormat('HH:mm:ss').format(endTime)}Z',
      };
      _eventService.editEvent(eventId: _event.id!, variables: variables);
    }
  }
}
