




changeView method - EventCalendarViewModel class - event\_calendar\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_calendar\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/view_model_after_auth_view_models_event_view_models_event_calendar_view_model-library.html)
3. [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4. changeView method

changeView


dark\_mode

light\_mode




# changeView method


void
changeView(

1. String view

)

Changes the view of the calendar.

**params**:

* `view`: String representing the desired view ("Day", "Month", "Schedule").

**returns**:
None


## Implementation

```
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
  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [event\_calendar\_view\_model](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/view_model_after_auth_view_models_event_view_models_event_calendar_view_model-library.html)
3. [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4. changeView method

##### EventCalendarViewModel class





talawa
1.0.0+1






