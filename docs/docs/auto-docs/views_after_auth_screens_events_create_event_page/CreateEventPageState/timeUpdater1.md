
<div>

# timeUpdater1 method

</div>


void timeUpdater1(

1.  [[[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.md)]
    time, ]
2.  [[[CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.md)]
    model]

)



Handles the selection and deselection of categories.

**params**:

-   `time`: Time for event
-   `model`: Model to be updated

**returns**: None



## Implementation

``` language-dart
void timeUpdater1(TimeOfDay time, CreateEventViewModel model) {
  final validationError = Validator.validateEventTime(
    time,
    model.eventEndTime,
  );

  if (validationError != null) {
    navigationService.showTalawaErrorSnackBar(
      'Start time must be before end time',
      MessageType.error,
    );
  } else {
    setState(() {
      model.eventStartTime = time;
    });
  }
}
```







1.  [talawa](../../index.md)
2.  [create_event_page](../../views_after_auth_screens_events_create_event_page/)
3.  [CreateEventPageState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState-class.md)
4.  timeUpdater1 method

##### CreateEventPageState class







