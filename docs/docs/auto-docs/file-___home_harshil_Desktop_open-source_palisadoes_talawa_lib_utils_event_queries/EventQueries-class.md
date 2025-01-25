




EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../index.html)
2. [utils/event\_queries.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. EventQueries class

EventQueries


dark\_mode

light\_mode




# EventQueries class


This class creates queries related to the events.


## Constructors

[EventQueries](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/EventQueries.html)()




## Properties

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited



## Methods

[addEvent](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/addEvent.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Creates a GraphQL mutation for adding an event.

[addVolunteerToGroup](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/addVolunteerToGroup.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Creates a GraphQL mutation for adding a volunteer to a group.

[attendeesByEvent](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/attendeesByEvent.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Fetches attendees by event ID.

[createAgendaItem](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/createAgendaItem.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Creates a GraphQL mutation for creating an agenda item.

[createVolunteerGroup](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/createVolunteerGroup.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Creates a GraphQL mutation for creating an event volunteer group.

[deleteAgendaItem](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/deleteAgendaItem.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Creates a GraphQL mutation for deleting an agenda item.

[deleteEvent](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/deleteEvent.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) id)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Creates a GraphQL mutation for deleting an event.

[fetchAgendaItemCategoriesByOrganization](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/fetchAgendaItemCategoriesByOrganization.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) organizationId)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Creates a GraphQL query for fetching agenda item categories by organization.

[fetchAgendaItemsByEvent](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/fetchAgendaItemsByEvent.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) relatedEventId)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Creates a GraphQL query for fetching agenda items by organization.

[fetchOrgEvents](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/fetchOrgEvents.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) orgId)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Fetches events by organization ID.

[fetchVolunteerGroups](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/fetchVolunteerGroups.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Fetches event volunteer groups based on criteria such as event ID.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[registerForEvent](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/registerForEvent.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Creates a GraphQL mutation for registering for an event.

[removeEventVolunteerGroup](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/removeEventVolunteerGroup.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Creates a GraphQL mutation for removing an event volunteer group.

[removeVolunteerMutation](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/removeVolunteerMutation.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Creates a GraphQL mutation for deleting a volunteer from a group.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited

[updateAgendaItem](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/updateAgendaItem.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Creates a GraphQL mutation for updating an agenda item.

[updateEvent](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/updateEvent.html)({dynamic eventId})
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Creates a GraphQL mutation for updating an event.

[updateVolunteerGroupMutation](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries/updateVolunteerGroupMutation.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


Mutation to update volunteer group insatnce.



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [event\_queries](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. EventQueries class

##### event\_queries library





talawa
1.0.0+1






