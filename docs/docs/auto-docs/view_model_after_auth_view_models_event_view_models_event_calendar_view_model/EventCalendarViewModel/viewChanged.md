




viewChanged method - EventCalendarViewModel class - event\_calendar\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_calendar\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/view_model_after_auth_view_models_event_view_models_event_calendar_view_model-library.html)
3. [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4. viewChanged method

viewChanged


dark\_mode

light\_mode




# viewChanged method


void
viewChanged(

1. [ViewChangedDetails](https://pub.dev/documentation/syncfusion_flutter_calendar/27.2.5/calendar/ViewChangedDetails-class.html) viewChangedDetails

)

The function to triggered when the view is changed.

**params**:

* `viewChangedDetails`: The dates that visible on the view changes in SfCalendar. type is ViewChangedDetails

**returns**:
None


## Implementation

```
void viewChanged(ViewChangedDetails viewChangedDetails) {
  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    _dateRangePickerController.selectedDate =
        viewChangedDetails.visibleDates[0];
    _dateRangePickerController.displayDate =
        viewChangedDetails.visibleDates[0];
  });
}
```

 


1. [talawa](../../index.html)
2. [event\_calendar\_view\_model](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/view_model_after_auth_view_models_event_view_models_event_calendar_view_model-library.html)
3. [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4. viewChanged method

##### EventCalendarViewModel class





talawa
1.0.0+1






