
<div>

# timeUpdater2 method

</div>


void timeUpdater2(

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
void timeUpdater2(TimeOfDay time, CreateEventViewModel model) {
  final validationError = Validator.validateEventTime(
    model.eventStartTime,
    time,
  );
  final showSnackBar = navigationService.showTalawaErrorSnackBar;
  if (validationError != null) {
    showSnackBar(
      'Start time must be before end time',
      MessageType.error,
    );
  } else {
    setState(() {
      model.eventEndTime = time;
    });
  }
}
```







1.  [talawa](../../index.md)
2.  [create_event_page](../../views_after_auth_screens_events_create_event_page/)
3.  [CreateEventPageState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState-class.md)
4.  timeUpdater2 method

##### CreateEventPageState class







