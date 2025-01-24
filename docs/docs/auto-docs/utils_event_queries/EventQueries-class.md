




EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../index.html)
2. [utils/event\_queries.dart](../utils_event_queries/utils_event_queries-library.html)
3. EventQueries class

EventQueries


dark\_mode

light\_mode




# EventQueries class


This class creates queries related to the events.


## Constructors

[EventQueries](../utils_event_queries/EventQueries/EventQueries.html)()




## Properties

[hashCode](../utils_event_queries/EventQueries/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[runtimeType](../utils_event_queries/EventQueries/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[addEvent](../utils_event_queries/EventQueries/addEvent.html)()
→ String


Creates a GraphQL mutation for adding an event.

[addVolunteerToGroup](../utils_event_queries/EventQueries/addVolunteerToGroup.html)()
→ String


Creates a GraphQL mutation for adding a volunteer to a group.

[attendeesByEvent](../utils_event_queries/EventQueries/attendeesByEvent.html)(String eventId)
→ String


Fetches attendees by event ID.

[createAgendaItem](../utils_event_queries/EventQueries/createAgendaItem.html)()
→ String


Creates a GraphQL mutation for creating an agenda item.

[createVolunteerGroup](../utils_event_queries/EventQueries/createVolunteerGroup.html)()
→ String


Creates a GraphQL mutation for creating an event volunteer group.

[deleteAgendaItem](../utils_event_queries/EventQueries/deleteAgendaItem.html)()
→ String


Creates a GraphQL mutation for deleting an agenda item.

[deleteEvent](../utils_event_queries/EventQueries/deleteEvent.html)(String id)
→ String


Creates a GraphQL mutation for deleting an event.

[fetchAgendaItemCategoriesByOrganization](../utils_event_queries/EventQueries/fetchAgendaItemCategoriesByOrganization.html)(String organizationId)
→ String


Creates a GraphQL query for fetching agenda item categories by organization.

[fetchAgendaItemsByEvent](../utils_event_queries/EventQueries/fetchAgendaItemsByEvent.html)(String relatedEventId)
→ String


Creates a GraphQL query for fetching agenda items by organization.

[fetchOrgEvents](../utils_event_queries/EventQueries/fetchOrgEvents.html)(String orgId)
→ String


Fetches events by organization ID.

[fetchVolunteerGroups](../utils_event_queries/EventQueries/fetchVolunteerGroups.html)()
→ String


Fetches event volunteer groups based on criteria such as event ID.

[noSuchMethod](../utils_event_queries/EventQueries/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[registerForEvent](../utils_event_queries/EventQueries/registerForEvent.html)()
→ String


Creates a GraphQL mutation for registering for an event.

[removeEventVolunteerGroup](../utils_event_queries/EventQueries/removeEventVolunteerGroup.html)()
→ String


Creates a GraphQL mutation for removing an event volunteer group.

[removeVolunteerMutation](../utils_event_queries/EventQueries/removeVolunteerMutation.html)()
→ String


Creates a GraphQL mutation for deleting a volunteer from a group.

[toString](../utils_event_queries/EventQueries/toString.html)()
→ String


A string representation of this object.
inherited

[updateAgendaItem](../utils_event_queries/EventQueries/updateAgendaItem.html)()
→ String


Creates a GraphQL mutation for updating an agenda item.

[updateEvent](../utils_event_queries/EventQueries/updateEvent.html)({dynamic eventId})
→ String


Creates a GraphQL mutation for updating an event.

[updateVolunteerGroupMutation](../utils_event_queries/EventQueries/updateVolunteerGroupMutation.html)()
→ String


Mutation to update volunteer group insatnce.



## Operators

[operator ==](../utils_event_queries/EventQueries/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [event\_queries](../utils_event_queries/utils_event_queries-library.html)
3. EventQueries class

##### event\_queries library





talawa
1.0.0+1






