# Overview for `ManageVolunteerGroupViewModel`

## Description

A ViewModel for managing volunteer groups within an event.

 This class handles operations related to volunteer groups including
 initializing the group, adding/removing volunteers, and updating group details.

## Dependencies

- BaseModel

## Members

- **event**: `Event`
  The event associated with the volunteer group.

- **orgMembersList**: `List<User>`
  List of organization members.

- **_memberCheckedMap**: `Map<String, bool>`
  A map to track the selection state of organization members.

- **_volunteers**: `List<EventVolunteer>`
  List of volunteers in the group.

- **_isFetchingVolunteers**: `bool`
  Indicates whether the view model is currently fetching volunteers.

