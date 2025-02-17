
<div>

# changeView method

</div>


void changeView(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    view]

)



Changes the view of the calendar.

**params**:

-   `view`: String representing the desired view (\"Day\", \"Month\",
    \"Schedule\").

**returns**: None



## Implementation

``` language-dart
void changeView(String view) {
  switch (view) {
    case "Day":
      _calendarView = CalendarView.day;
      break;
    case "Month":
      _calendarView = CalendarView.month;
      break;
    case "Schedule":
      _calendarView = CalendarView.schedule;
      break;
    default:
      break;
  }
  calendarController.view = _calendarView;
  ;
}
```







1.  [talawa](../../index.md)
2.  [event_calendar_view_model](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/)
3.  [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.md)
4.  changeView method

##### EventCalendarViewModel class







