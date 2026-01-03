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

- **attendees**: `List<Attendee>`
  List of Attendee type to store the attendees data.

- **_volunteerGroups**: `List<EventVolunteerGroup>`
- **_agendaItems**: `List<EventAgendaItem>`
- **_categories**: `List<AgendaCategory>`
- **_selectedCategories**: `List<AgendaCategory>`
  List to store selected Agenda categories for an agenda item.

