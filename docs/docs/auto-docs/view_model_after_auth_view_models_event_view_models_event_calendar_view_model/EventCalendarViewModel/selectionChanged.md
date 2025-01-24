




selectionChanged method - EventCalendarViewModel class - event\_calendar\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_calendar\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/view_model_after_auth_view_models_event_view_models_event_calendar_view_model-library.html)
3. [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4. selectionChanged method

selectionChanged


dark\_mode

light\_mode




# selectionChanged method


void
selectionChanged(

1. [DateRangePickerSelectionChangedArgs](https://pub.dev/documentation/syncfusion_flutter_datepicker/27.2.5/datepicker/DateRangePickerSelectionChangedArgs-class.html) args

)

function to be triggered when selection is changed.

**params**:

* `args`: Object of type DateRangePickerSelectionChangedArgs, The selected dates or ranges changes in the SfDateRangePicker.

**returns**:
None


## Implementation

```
void selectionChanged(DateRangePickerSelectionChangedArgs args) {
  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    _calendarController.displayDate = args.value as DateTime?;
  });
}
```

 


1. [talawa](../../index.html)
2. [event\_calendar\_view\_model](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/view_model_after_auth_view_models_event_view_models_event_calendar_view_model-library.html)
3. [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4. selectionChanged method

##### EventCalendarViewModel class





talawa
1.0.0+1






