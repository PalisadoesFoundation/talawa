# Overview for `EditEventViewModel`

## Description

EditEventViewModel class have methods to interact with model in.

 the context of editing the event in the organization.

 Methods include:
 * `updateEvent` : to update an event.

## Dependencies

- BaseEventViewModel

## Members

- **_event**: `Event`
- **calendarViewModel**: `dynamic`
  Reference to the EventCalendarViewModel for calendar interactions.

- **eventId**: `String?`
  Event ID.

- **wasRecurringOriginally**: `bool`
  Original recurrence state.

