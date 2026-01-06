# Overview for `EventInfoViewModel`

## Description

EventInfoViewModel class helps interacting with model to serve view with the event information data.

## Dependencies

- BaseModel

## Members

- **event**: `Event`
  Event instance to store the event data.

- **eventService**: `dynamic`
  Instance of EventService to manage event-related operations.

- **calendarViewModel**: `dynamic`
  Instance  of calendar view model to manage calendar related operations.

- **fabTitle**: `String`
  String type variable to store the FAB title.

- **attendees**: `List&lt;Attendee&gt;`
  List of Attendee type to store the attendees data.

- **_volunteerGroups**: `List&lt;EventVolunteerGroup&gt;`
- **_agendaItems**: `List&lt;EventAgendaItem&gt;`
- **_categories**: `List&lt;AgendaCategory&gt;`
- **_selectedCategories**: `List&lt;AgendaCategory&gt;`
  List to store selected Agenda categories for an agenda item.

