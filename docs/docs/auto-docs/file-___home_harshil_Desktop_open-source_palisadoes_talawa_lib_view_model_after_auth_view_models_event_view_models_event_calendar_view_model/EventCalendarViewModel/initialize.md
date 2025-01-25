




initialize method - EventCalendarViewModel class - event\_calendar\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_calendar\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_calendar_view_model/)
3. [EventCalendarViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4. initialize method

initialize


dark\_mode

light\_mode




# initialize method


void
initialize(

1. [List](https://api.flutter.dev/flutter/dart-core/List-class.html) eventList

)

Initializes the view model.

**params**:

* `eventList`: list of events.

**returns**:
None


## Implementation

```
void initialize(List<Event> eventList) {
  _eventList = eventList;
  _calendarView = CalendarView.schedule;
}
```

 


1. [talawa](../../index.html)
2. [event\_calendar\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_calendar_view_model/)
3. [EventCalendarViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4. initialize method

##### EventCalendarViewModel class





talawa
1.0.0+1






