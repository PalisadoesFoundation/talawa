
<div>

# dateUpdater1 method

</div>


void dateUpdater1(

1.  [[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.md)]
    date, ]
2.  [[[CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.md)]
    model]

)



Handles the selection and deselection of categories.

**params**:

-   `date`: Date for event
-   `model`: Model to be updated

**returns**: None



## Implementation

``` language-dart
void dateUpdater1(DateTime date, CreateEventViewModel model) {
  if (date.isBefore(DateTime.)) {
    navigationService.showSnackBar(
      "Cannot create events having date prior than today",
    );
  } else {
    setState(() {
      if (model.eventStartDate != date) {
        model.eventStartDate = date;
        model.recurrenceStartDate = date;
        model.recurrenceLabel = 'Does not repeat';
        model.isRecurring = false;
        model.frequency = Frequency.weekly;
        model.weekDays = {};
        model.weekDayOccurenceInMonth = null;
      }
    });
  }
}
```







1.  [talawa](../../index.md)
2.  [create_event_page](../../views_after_auth_screens_events_create_event_page/)
3.  [CreateEventPageState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState-class.md)
4.  dateUpdater1 method

##### CreateEventPageState class







