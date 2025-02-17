
<div>

# calendarViewSelection method

</div>


[[PopupMenuButton](https://api.flutter.dev/flutter/material/PopupMenuButton-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]]
calendarViewSelection(

1.  [[[EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.md)]
    model]

)



Popupmenu Button to select calendar view.

**params**:

-   `model`: EventCalendarViewModel.

**returns**:

-   `PopupMenuButton<String>`: custom PopupMenuButton..



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [event_calendar](../../views_after_auth_screens_events_event_calendar/)
3.  [EventCalendar](../../views_after_auth_screens_events_event_calendar/EventCalendar-class.md)
4.  calendarViewSelection method

##### EventCalendar class







