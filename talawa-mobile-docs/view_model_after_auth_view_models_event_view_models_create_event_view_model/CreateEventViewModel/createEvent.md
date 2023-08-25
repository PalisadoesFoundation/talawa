


# createEvent method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> createEvent
()





<p>This function is used to create the event for the organization.</p>
<p>The function uses <code>database_mutation_functions</code> services to call the graphQL mutation
for creating an event and passes the required variables for the event.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;void&gt;</code>: Asynchronous function for creating event</li>
</ul>



## Implementation

```dart
Future<void> createEvent() async {
  titleFocus.unfocus();
  locationFocus.unfocus();
  descriptionFocus.unfocus();
  validate = AutovalidateMode.always;
  if (formKey.currentState!.validate()) {
    validate = AutovalidateMode.disabled;

    // variables initialisation
    final DateTime startDate = eventStartDate;
    final DateTime endDate = eventEndDate;
    final DateTime startTime = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
      eventStartTime.hour,
      eventStartTime.minute,
    );
    final DateTime endTime = DateTime(
      endDate.year,
      endDate.month,
      endDate.day,
      eventEndTime.hour,
      eventEndTime.minute,
    );

    // all required data for creating an event
    final Map<String, dynamic> variables = {
      'startDate': DateFormat('yyyy-MM-dd').format(startDate),
      'endDate': DateFormat('yyyy-MM-dd').format(endDate),
      'organizationId': _currentOrg.id,
      'title': eventTitleTextController.text,
      'description': eventDescriptionTextController.text,
      'location': eventLocationTextController.text,
      'isPublic': isPublicSwitch,
      'isRegisterable': isRegisterableSwitch,
      'recurring': false,
      'allDay': false,
      'startTime': '${DateFormat('HH:mm:ss').format(startTime)}Z',
      'endTime': '${DateFormat('HH:mm:ss').format(endTime)}Z',
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
    };

    navigationService.pushDialog(
      const CustomProgressDialog(key: Key('EventCreationProgress')),
    );
    final tokenResult = await databaseFunctions
        .refreshAccessToken(userConfig.currentUser.refreshToken!);
    print(tokenResult);
    // invoke the `gqlAuthMutation` function of `databaseFunctions`
    // service along with the mutation query and variable map.
    final result = await databaseFunctions.gqlAuthMutation(
      EventQueries().addEvent(),
      variables: variables,
    );
    navigationService.pop();
    if (result != null) {
      navigationService.pop();

      await _eventService.getEvents();
    }
  }
}
```







