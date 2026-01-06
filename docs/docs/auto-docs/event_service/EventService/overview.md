# Overview for `EventService`

## Description

EventService class provides different services in the context of Event.

 Services include:
 * `setOrgStreamSubscription` : to set organization stream subscription for user.
 * `getEvents` : to get all events of the organization.
 * `fetchAttendeesByEvent` : to fetch all attendees of an event.
 * `registerForAnEvent` : to register for an event.
 * `deleteEvent` : to delete an event.
 * `editEvent` : to edit the event.
 * `fetchEventVolunteers` : to fetch all volunteers of an event.
 * `createVolunteerGroup` : to create a volunteer group.
 * `addVolunteerToGroup` : to add a volunteer to a group.
 * `dispose` : to cancel the stream subscription of an organization.

## Dependencies

- BaseFeedManager

## Members

- **_userConfig**: `dynamic`
- **_dbFunctions**: `dynamic`
- **_currentOrganizationStreamSubscription**: `StreamSubscription?`
- **_eventStream**: `Stream&lt;List&lt;Event&gt;&gt;`
- **_eventStreamController**: `StreamController&lt;List&lt;Event&gt;&gt;`
- **_events**: `List&lt;Event&gt;`
## Constructors

### Unnamed Constructor


