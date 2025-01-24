




initialize method - EventCalendarViewModel class - event\_calendar\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_calendar\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/view_model_after_auth_view_models_event_view_models_event_calendar_view_model-library.html)
3. [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4. initialize method

initialize


dark\_mode

light\_mode




# initialize method


void
initialize(

1. List<[Event](../../models_events_event_model/Event-class.html)> eventList

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
2. [event\_calendar\_view\_model](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/view_model_after_auth_view_models_event_view_models_event_calendar_view_model-library.html)
3. [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4. initialize method

##### EventCalendarViewModel class





talawa
1.0.0+1






