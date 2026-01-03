# Overview for `EventCalendarViewModel`

## Description

ViewModel for managing events and calendar view.

 This ViewModel handles operations related to events and calendar views.

## Dependencies

- BaseModel

## Members

- **eventService**: `dynamic`
  Instance of EventService to manage event-related operations.

- **_userConfig**: `dynamic`
  Instance of UserConfig to track organization changes.

- **_calendarController**: `CalendarController`
  Controller for managing the calendar.

- **_currentOrganizationStreamSubscription**: `StreamSubscription?`
  Subscription for tracking changes in the current organization.

- **_eventStreamSubscription**: `StreamSubscription?`
  Subscription for tracking changes in events.

- **_dateRangePickerController**: `DateRangePickerController`
  Controller for managing the date range picker.

- **_calendarView**: `CalendarView`
  The current view of the calendar.

- **_eventList**: `List<Event>`
  List of events.

