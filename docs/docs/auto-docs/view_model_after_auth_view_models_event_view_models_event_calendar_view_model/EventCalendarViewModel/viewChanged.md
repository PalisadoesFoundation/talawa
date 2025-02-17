
<div>

# viewChanged method

</div>


void viewChanged(

1.  [[[ViewChangedDetails](https://pub.dev/documentation/syncfusion_flutter_calendar/28.2.3/calendar/ViewChangedDetails-class.html)]
    viewChangedDetails]

)



The function to triggered when the view is changed.

**params**:

-   `viewChangedDetails`: The dates that visible on the view changes in
    SfCalendar. type is ViewChangedDetails

**returns**: None



## Implementation

``` language-dart
void viewChanged(ViewChangedDetails viewChangedDetails) {
  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    _dateRangePickerController.selectedDate =
        viewChangedDetails.visibleDates[0];
    _dateRangePickerController.displayDate =
        viewChangedDetails.visibleDates[0];
  });
}
```







1.  [talawa](../../index.html)
2.  [event_calendar_view_model](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/)
3.  [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4.  viewChanged method

##### EventCalendarViewModel class







