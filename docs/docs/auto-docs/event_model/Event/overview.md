# Overview for `Event`

## Description

This class creates an event model and returns an Event instance.

## Members

- **id**: `String?`
  Unique identifier for the event.

- **name**: `String?`
  The title of the event.

- **description**: `String?`
  The description of the event.

- **location**: `String?`
  The location of the event.

- **recurring**: `bool?`
  A boolean value that indicates if the event is recurring.

- **allDay**: `bool?`
  A boolean value that indicates if the event is an all-day event.

- **startAt**: `DateTime?`
  The start DateTime of the event.

- **endAt**: `DateTime?`
  The end DateTime of the event.

- **isPublic**: `bool?`
  A boolean value that indicates if the event is public.

- **isRegistered**: `bool?`
  A boolean value that indicates if the user is registered for the event.

- **isRegisterable**: `bool?`
  A boolean value that indicates if the event is registerable.

- **creator**: `User?`
  The creator of the event.

- **organization**: `OrgInfo?`
  The organization of the event.

- **admins**: `List<User>?`
  The admins of the event.

- **attendees**: `List<Attendee>?`
  The attendees of the event.

- **agendaItems**: `List<EventAgendaItem>?`
  Agenda items associated with the event.

- **isRecurringEventTemplate**: `bool?`
  Is this event a template for recurring events.

- **baseEvent**: `Event?`
  The base event for which this materialized instance was created.

- **progressLabel**: `String?`
  Human-readable label indicating the progress of this instance in the series, such as '5 of 12' or 'Episode #7'.

- **sequenceNumber**: `int?`
  The sequence number of this instance within its recurring series (e.g., 1, 2, 3, ...).

- **totalCount**: `int?`
  The total number of instances in the complete recurring series. This will be null for infinite series.

- **venues**: `List<Venue>?`
  Venues booked for the event.

- **recurrenceRule**: `RecurrenceRule?`
  Recurrence rule for the event.

## Constructors

### Unnamed Constructor


### fromJson


#### Parameters

- `json`: `Map<String, dynamic>`
