import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/constants/app_strings.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// EditEventViewModel class have methods to interact with model in.
///
/// the context of editing the event in the organization.
///
/// Methods include:
/// * `updateEvent` : to update an event.
class EditEventViewModel extends BaseModel {
  // Variable to hold the event details.
  late Event _event;

  /// TextEditingController to handle the text input for the event title.
  TextEditingController eventTitleTextController = TextEditingController();

  /// TextEditingController to handle the text input for the event location.
  TextEditingController eventLocationTextController = TextEditingController();

  /// TextEditingController to handle the text input for the event description.
  TextEditingController eventDescriptionTextController =
      TextEditingController();

  /// TimeOfDay to store the selected start time for the event.
  TimeOfDay eventStartTime = TimeOfDay.now();

  /// TimeOfDay to store the selected end time for the event.
  TimeOfDay eventEndTime = TimeOfDay.now();

  /// DateTime to store the selected start date for the event.
  DateTime eventStartDate = DateTime.now();

  /// DateTime to store the selected end date for the event.
  DateTime eventEndDate = DateTime.now();

  /// Boolean to indicate if the event is public or private. True means public.
  bool isPublicSwitch = true;

  /// Boolean to indicate if the event requires registration. True means registration is required.
  bool isRegisterableSwitch = false;

  /// FocusNode to manage focus for the event title text input field.
  FocusNode titleFocus = FocusNode();

  /// FocusNode to manage focus for the event location text input field.
  FocusNode locationFocus = FocusNode();

  /// FocusNode to manage focus for the event description text input field.
  FocusNode descriptionFocus = FocusNode();

  /// Form key for edit event.
  final formKey = GlobalKey<FormState>();

  final _eventService = locator<EventService>();

  /// Validation flag.
  AutovalidateMode validate = AutovalidateMode.disabled;

  /// Method to initialize the event and fill the edit form.
  ///
  /// **params**:
  /// * `event`: An instance of `Event` that contains the details to initialize and fill the form.
  ///
  /// **returns**:
  ///   None
  void initialize(Event event) {
    _event = event;
    _fillEditForm();
  }

  /// Method to populate the form fields with data from the provided event.
  ///
  /// This method initializes the text controllers and switches with values
  /// from the `_event` instance. It also parses and sets the event's start and
  /// end date and time.
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
    eventStartDate = DateFormat().add_yMd().parse(_event.startDate!);
    eventEndDate = DateFormat().add_yMd().parse(_event.endDate!);
    eventStartTime =
        TimeOfDay.fromDateTime(DateFormat("h:mm a").parse(_event.startTime!));
    eventEndTime =
        TimeOfDay.fromDateTime(DateFormat("h:mm a").parse(_event.endTime!));
  }

  /// Updates an existing event with the data from the form.
  ///
  /// This method performs the following actions:
  /// 1. Unfocuses all text fields and sets form validation mode to always.
  /// 2. Validates the form. If valid, it constructs a map of event details including
  ///    start and end dates and times, and other attributes.
  /// 3. Displays a loading dialog while the API request is being processed.
  /// 4. Calls the service method to update the event with the provided data.
  /// 5. On success, navigates to the explore events screen.
  /// 6. On success, also updates the UI and removes the loading dialog.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> updateEvent() async {
    await actionHandlerService.performAction(
      actionType: ActionType.critical,
      criticalActionFailureMessage: TalawaErrors.eventUpdateFailed,
      action: () async {
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
          navigationService.pushDialog(
            const CustomProgressDialog(
              key: Key('EditEventProgress'),
            ),
          );
          final result = await _eventService.editEvent(
            eventId: _event.id!,
            variables: variables,
          );
          print(result.isConcrete);
          return result;
        }
        return databaseFunctions.noData;
      },
      onValidResult: (result) async {
        navigationService.removeAllAndPush(
          Routes.exploreEventsScreen,
          Routes.mainScreen,
          arguments: MainScreenArgs(mainScreenIndex: 0, fromSignUp: false),
        );
      },
      apiCallSuccessUpdateUI: () {
        navigationService.pop();
      },
    );
  }
}
