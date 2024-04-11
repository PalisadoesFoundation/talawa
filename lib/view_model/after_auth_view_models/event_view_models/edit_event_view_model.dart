import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// `EditEventViewModel` is a class that extends `BaseModel`.
///
/// It provides methods and properties to manage the state and behavior of the Edit Event view.
/// This includes text controllers for event details, focus nodes for form fields, and methods to initialize and update events.
///
/// The class uses the `EventService` to perform operations related to events.
class EditEventViewModel extends BaseModel {
  late Event _event;

  /// Controller for the title of the event.
  TextEditingController eventTitleTextController = TextEditingController();

  /// Controller for the location of the event.
  TextEditingController eventLocationTextController = TextEditingController();

  /// Controller for the description of the event.
  TextEditingController eventDescriptionTextController =
      TextEditingController();

  /// Start time of the event.
  TimeOfDay eventStartTime = TimeOfDay.now();

  /// End time of the event.
  TimeOfDay eventEndTime = TimeOfDay.now();

  /// Start date of the event.
  DateTime eventStartDate = DateTime.now();

  /// End date of the event.
  DateTime eventEndDate = DateTime.now();

  /// Switch to toggle the event's public status.
  bool isPublicSwitch = true;

  /// Switch to toggle the event's registerable status.
  bool isRegisterableSwitch = false;

  /// Focus node for the title of the event.
  FocusNode titleFocus = FocusNode();

  /// Focus node for the location of the event.
  FocusNode locationFocus = FocusNode();

  /// Focus node for the description of the event.
  FocusNode descriptionFocus = FocusNode();

  /// Key for the form.
  final formKey = GlobalKey<FormState>();

  final _eventService = locator<EventService>();

  /// Autovalidate mode for the form.
  AutovalidateMode validate = AutovalidateMode.disabled;

  /// This function initializes the controller with the data.
  ///
  /// **params**:
  /// * `event`: The event to initialize the controller with.
  ///
  /// **returns**:
  ///   None

  void initialize(Event event) {
    _event = event;
    _fillEditForm();
  }

  /// This function fills the edit form with the event details.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None

  void _fillEditForm() {
    eventTitleTextController.text = _event.title!;
    eventLocationTextController.text = _event.location!;
    eventDescriptionTextController.text = _event.description!;
    isPublicSwitch = _event.isPublic!;
    isRegisterableSwitch = _event.isRegisterable!;
    eventStartDate = DateFormat('yyyy-MM-dd').parse(_event.startDate!);
    eventEndDate = DateFormat('yyyy-MM-dd').parse(_event.endDate!);
    eventStartTime =
        TimeOfDay.fromDateTime(DateFormat("HH:mm:ss").parse(_event.startTime!));
    eventEndTime =
        TimeOfDay.fromDateTime(DateFormat("HH:mm:ss").parse(_event.endTime!));
  }

  /// This function updates the event with the new data.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None

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
