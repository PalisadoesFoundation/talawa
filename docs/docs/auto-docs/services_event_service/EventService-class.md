




EventService class - event\_service library - Dart API







menu

1. [talawa](../index.html)
2. [services/event\_service.dart](../services_event_service/services_event_service-library.html)
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

Inheritance

* Object
* [BaseFeedManager](../services_caching_base_feed_manager/BaseFeedManager-class.html)<[Event](../models_events_event_model/Event-class.html)>
* EventService



## Constructors

[EventService](../services_event_service/EventService/EventService.html)()




## Properties

[cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.html)
→ String

feed cacheBox key.
finalinherited

[currentOrg](../services_event_service/EventService/currentOrg.html)
→ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)

The event stream.
no setter

[eventStream](../services_event_service/EventService/eventStream.html)
→ Stream<List<[Event](../models_events_event_model/Event-class.html)>>

The event stream.
no setter

[hashCode](../services_caching_base_feed_manager/BaseFeedManager/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[runtimeType](../services_caching_base_feed_manager/BaseFeedManager/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[addVolunteerToGroup](../services_event_service/EventService/addVolunteerToGroup.html)(Map<String, dynamic> variables)
→ Future


This function is used to add a volunteer to a group.

[createAgendaItem](../services_event_service/EventService/createAgendaItem.html)(Map<String, dynamic> variables)
→ Future


This function is used to create an agenda item.

[createEvent](../services_event_service/EventService/createEvent.html)({required Map<String, dynamic> variables})
→ Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>


This function is used to create an event using a GraphQL mutation.

[createVolunteerGroup](../services_event_service/EventService/createVolunteerGroup.html)(Map<String, dynamic> variables)
→ Future


This function is used to create a volunteer group.

[deleteAgendaItem](../services_event_service/EventService/deleteAgendaItem.html)(Map<String, dynamic> variables)
→ Future


This function is used to delete an agenda item.

[deleteEvent](../services_event_service/EventService/deleteEvent.html)(String eventId)
→ Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>


This function is used to delete the event.

[dispose](../services_event_service/EventService/dispose.html)()
→ void


This function is used to cancel the stream subscription of an organization.

[editEvent](../services_event_service/EventService/editEvent.html)({required String eventId, required Map<String, dynamic> variables})
→ Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>


This function is used to edit an event.

[fetchAgendaCategories](../services_event_service/EventService/fetchAgendaCategories.html)(String orgId)
→ Future


This function is used to create an agenda item.

[fetchAgendaItems](../services_event_service/EventService/fetchAgendaItems.html)(String eventId)
→ Future


This function is used to fetch all agenda items for a specific organization.

[fetchAttendeesByEvent](../services_event_service/EventService/fetchAttendeesByEvent.html)(String eventId)
→ Future


This function is used to fetch all registrants of an event.

[fetchDataFromApi](../services_event_service/EventService/fetchDataFromApi.html)()
→ Future<List<[Event](../models_events_event_model/Event-class.html)>>


Abstract method to be implemented by subclasses to fetch data from an API.
override

[fetchEventsInitial](../services_event_service/EventService/fetchEventsInitial.html)()
→ Future<void>


Fetches the initial set of events, loading from the cache first, and then refreshing the feed.

[fetchVolunteerGroupsByEvent](../services_event_service/EventService/fetchVolunteerGroupsByEvent.html)(String eventId)
→ Future<List<[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.html)>>


This function is used to fetch all volunteer groups for an event.

[getEvents](../services_event_service/EventService/getEvents.html)()
→ Future<void>


This function is used to fetch all the events of an organization.

[getNewFeedAndRefreshCache](../services_caching_base_feed_manager/BaseFeedManager/getNewFeedAndRefreshCache.html)()
→ Future<List<[Event](../models_events_event_model/Event-class.html)>>


Fetches new data from the API if online, updates the cache, and returns the data.
inherited

[loadCachedData](../services_caching_base_feed_manager/BaseFeedManager/loadCachedData.html)()
→ Future<List<[Event](../models_events_event_model/Event-class.html)>>


Loads the data cached in Hive.
inherited

[noSuchMethod](../services_caching_base_feed_manager/BaseFeedManager/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[refreshFeed](../services_event_service/EventService/refreshFeed.html)()
→ Future<void>


Refreshes the event feed by fetching the latest events from the API and updating the event stream.

[registerForAnEvent](../services_event_service/EventService/registerForAnEvent.html)(String eventId)
→ Future


This function is used to register user for an event.

[removeVolunteerFromGroup](../services_event_service/EventService/removeVolunteerFromGroup.html)(Map<String, dynamic> variables)
→ Future


This function is used to remove a volunteer from a group.

[removeVolunteerGroup](../services_event_service/EventService/removeVolunteerGroup.html)(Map<String, dynamic> variables)
→ Future


This function is used to remove a volunteer group.

[saveDataToCache](../services_caching_base_feed_manager/BaseFeedManager/saveDataToCache.html)(List<[Event](../models_events_event_model/Event-class.html)> data)
→ Future<void>


Saves a list of data to the cache, replacing any existing data.
inherited

[setOrgStreamSubscription](../services_event_service/EventService/setOrgStreamSubscription.html)()
→ void


This function is used to set stream subscription for an organization.

[toString](../services_caching_base_feed_manager/BaseFeedManager/toString.html)()
→ String


A string representation of this object.
inherited

[updateAgendaItem](../services_event_service/EventService/updateAgendaItem.html)(String itemId, Map<String, dynamic> variables)
→ Future


This function is used to update an agenda item.

[updateVolunteerGroup](../services_event_service/EventService/updateVolunteerGroup.html)(Map<String, dynamic> variables)
→ Future


This function is used to update the information of a volunteer group.



## Operators

[operator ==](../services_caching_base_feed_manager/BaseFeedManager/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [event\_service](../services_event_service/services_event_service-library.html)
3. EventService class

##### event\_service library





talawa
1.0.0+1






