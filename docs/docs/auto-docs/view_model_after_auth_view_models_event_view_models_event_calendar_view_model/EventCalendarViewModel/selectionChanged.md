
<div>

# selectionChanged method

</div>


void selectionChanged(

1.  [[[DateRangePickerSelectionChangedArgs](https://pub.dev/documentation/syncfusion_flutter_datepicker/28.2.3/datepicker/DateRangePickerSelectionChangedArgs-class.md)]
    args]

)



function to be triggered when selection is changed.

**params**:

-   `args`: Object of type DateRangePickerSelectionChangedArgs, The
    selected dates or ranges changes in the SfDateRangePicker.

**returns**: None



## Implementation

``` language-dart
void selectionChanged(DateRangePickerSelectionChangedArgs args) {
  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    _calendarController.displayDate = args.value as DateTime?;
  });
}
```







1.  [talawa](../../index.md)
2.  [event_calendar_view_model](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/)
3.  [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.md)
4.  selectionChanged method

##### EventCalendarViewModel class







