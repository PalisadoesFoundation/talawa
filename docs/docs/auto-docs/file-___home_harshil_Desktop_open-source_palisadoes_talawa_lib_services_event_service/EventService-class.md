




EventService class - event\_service library - Dart API







menu

1. [talawa](../index.html)
2. [services/event\_service.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. EventService class

EventService


dark\_mode

light\_mode




# EventService class


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

## Constructors

[EventService](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/EventService.html)()




## Properties

[currentOrg](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/currentOrg.html)
→ dynamic

The event stream.
no setter

[eventStream](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/eventStream.html)
→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>

The event stream.
no setter

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited



## Methods

[addVolunteerToGroup](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/addVolunteerToGroup.html)([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to add a volunteer to a group.

[createAgendaItem](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/createAgendaItem.html)([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to create an agenda item.

[createEvent](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/createEvent.html)({required [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to create an event using a GraphQL mutation.

[createVolunteerGroup](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/createVolunteerGroup.html)([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to create a volunteer group.

[deleteAgendaItem](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/deleteAgendaItem.html)([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to delete an agenda item.

[deleteEvent](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/deleteEvent.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to delete the event.

[dispose](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/dispose.html)()
→ void


This function is used to cancel the stream subscription of an organization.

[editEvent](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/editEvent.html)({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId, required [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to edit an event.

[fetchAgendaCategories](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/fetchAgendaCategories.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) orgId)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to create an agenda item.

[fetchAgendaItems](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/fetchAgendaItems.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to fetch all agenda items for a specific organization.

[fetchAttendeesByEvent](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/fetchAttendeesByEvent.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to fetch all registrants of an event.

[fetchDataFromApi](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/fetchDataFromApi.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>



[fetchEventsInitial](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/fetchEventsInitial.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Fetches the initial set of events, loading from the cache first, and then refreshing the feed.

[fetchVolunteerGroupsByEvent](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/fetchVolunteerGroupsByEvent.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>


This function is used to fetch all volunteer groups for an event.

[getEvents](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/getEvents.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function is used to fetch all the events of an organization.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[refreshFeed](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/refreshFeed.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Refreshes the event feed by fetching the latest events from the API and updating the event stream.

[registerForAnEvent](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/registerForAnEvent.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to register user for an event.

[removeVolunteerFromGroup](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/removeVolunteerFromGroup.html)([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to remove a volunteer from a group.

[removeVolunteerGroup](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/removeVolunteerGroup.html)([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to remove a volunteer group.

[setOrgStreamSubscription](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/setOrgStreamSubscription.html)()
→ void


This function is used to set stream subscription for an organization.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited

[updateAgendaItem](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/updateAgendaItem.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) itemId, [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to update an agenda item.

[updateVolunteerGroup](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService/updateVolunteerGroup.html)([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to update the information of a volunteer group.



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [event\_service](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. EventService class

##### event\_service library





talawa
1.0.0+1






