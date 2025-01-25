




calendarViewSelection method - EventCalendar class - event\_calendar library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/events/event\_calendar.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_event_calendar/)
3. [EventCalendar](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_event_calendar/EventCalendar-class.html)
4. calendarViewSelection method

calendarViewSelection


dark\_mode

light\_mode




# calendarViewSelection method


dynamic
calendarViewSelection(

1. dynamic model

)

Popupmenu Button to select calendar view.

**params**:

* `model`: EventCalendarViewModel.

**returns**:

* `PopupMenuButton<String>`: custom PopupMenuButton..

## Implementation

```
PopupMenuButton<String> calendarViewSelection(EventCalendarViewModel model) {
  final List<String> views = ["Day", "Month", "Schedule"];
  return PopupMenuButton<String>(
    itemBuilder: (context) {
      return <PopupMenuEntry<String>>[
        for (final view in views)
          PopupMenuItem(
            value: view,
            child: Text(view),
          ),
      ];
    },
    onSelected: (value) {
      model.changeView(value);
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [event\_calendar](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_event_calendar/)
3. [EventCalendar](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_event_calendar/EventCalendar-class.html)
4. calendarViewSelection method

##### EventCalendar class





talawa
1.0.0+1






