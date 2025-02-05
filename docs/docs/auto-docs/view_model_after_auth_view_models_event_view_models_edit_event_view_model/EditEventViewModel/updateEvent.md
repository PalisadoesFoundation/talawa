


# updateEvent method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> updateEvent
()





<p>This function is used to update an event.
The function uses <code>editEvent</code> function provided by <code>eventService</code> service.</p>



## Implementation

```dart
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
```







