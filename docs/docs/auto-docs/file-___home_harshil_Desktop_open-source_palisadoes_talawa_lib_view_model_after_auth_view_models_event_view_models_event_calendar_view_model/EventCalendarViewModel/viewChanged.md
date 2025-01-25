




viewChanged method - EventCalendarViewModel class - event\_calendar\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_calendar\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_calendar_view_model/)
3. [EventCalendarViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4. viewChanged method

viewChanged


dark\_mode

light\_mode




# viewChanged method


void
viewChanged(

1. dynamic viewChangedDetails

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
2. [event\_calendar\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_calendar_view_model/)
3. [EventCalendarViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4. viewChanged method

##### EventCalendarViewModel class





talawa
1.0.0+1






