
<div>

# dateUpdater2 method

</div>


void dateUpdater2(

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
void dateUpdater2(DateTime date, CreateEventViewModel model) {
  final startDate = model.eventStartDate;

  if (startDate.compareTo(date) < 0) {
    setState(() {
      if (model.eventEndDate != date) {
        model.eventEndDate = date;
        model.recurrenceLabel = 'Does not repeat';
        model.recurrenceEndDate = null;
        model.isRecurring = false;
        model.frequency = Frequency.weekly;
        model.weekDays = {};
        model.weekDayOccurenceInMonth = null;
      }
    });
  } else {
    navigationService.showSnackBar(
      "End Date cannot be after start date",
    );
  }
}
```







1.  [talawa](../../index.md)
2.  [create_event_page](../../views_after_auth_screens_events_create_event_page/)
3.  [CreateEventPageState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState-class.md)
4.  dateUpdater2 method

##### CreateEventPageState class







