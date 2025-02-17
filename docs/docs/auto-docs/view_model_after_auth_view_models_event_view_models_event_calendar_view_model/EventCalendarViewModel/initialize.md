
<div>

# initialize method

</div>


void initialize(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[Event](../../models_events_event_model/Event-class.md)]\>]]
    eventList]

)



Initializes the view model.

**params**:

-   `eventList`: list of events.

**returns**: None



## Implementation

``` language-dart
void initialize(List<Event> eventList) {
  _eventList = eventList;
  _calendarView = CalendarView.schedule;
}
```







1.  [talawa](../../index.md)
2.  [event_calendar_view_model](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/)
3.  [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.md)
4.  initialize method

##### EventCalendarViewModel class







