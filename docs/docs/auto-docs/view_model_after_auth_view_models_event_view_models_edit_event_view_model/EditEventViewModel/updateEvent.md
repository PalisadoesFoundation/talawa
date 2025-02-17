
<div>

# updateEvent method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Updates an existing event with the data from the form.

This method performs the following actions:

1.  Unfocuses all text fields and sets form validation mode to always.
2.  Validates the form. If valid, it constructs a map of event details
    including start and end dates and times, and other attributes.
3.  Displays a loading dialog while the API request is being processed.
4.  Calls the service method to update the event with the provided data.
5.  On success, navigates to the explore events screen.
6.  On success, also updates the UI and removes the loading dialog.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  await actionHandlerService.performAction(
    actionType: ActionType.critical,
    criticalActionFailureMessage: TalawaErrors.eventUpdateFailed,
    action: () async {
      titleFocus.;
      locationFocus.;
      descriptionFocus.;
      validate = AutovalidateMode.always;
      if (formKey.currentState?. ?? false) {
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
      navigationService.;
    },
  );
}
```







1.  [talawa](../../index.md)
2.  [edit_event_view_model](../../view_model_after_auth_view_models_event_view_models_edit_event_view_model/)
3.  [EditEventViewModel](../../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel-class.md)
4.  updateEvent method

##### EditEventViewModel class







