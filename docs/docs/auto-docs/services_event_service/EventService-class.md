
<div>

# EventService class

</div>


EventService class provides different services in the context of Event.

Services include:

-   `setOrgStreamSubscription` : to set organization stream subscription
    for user.
-   `getEvents` : to get all events of the organization.
-   `fetchAttendeesByEvent` : to fetch all attendees of an event.
-   `registerForAnEvent` : to register for an event.
-   `deleteEvent` : to delete an event.
-   `editEvent` : to edit the event.
-   `fetchEventVolunteers` : to fetch all volunteers of an event.
-   `createVolunteerGroup` : to create a volunteer group.
-   `addVolunteerToGroup` : to add a volunteer to a group.
-   `dispose` : to cancel the stream subscription of an organization.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [BaseFeedManager](../services_caching_base_feed_manager/BaseFeedManager-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]\>]
    -   EventService



## Constructors

[EventService](../services_event_service/EventService/EventService.html)

:   



## Properties

[[cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.html)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   feed cacheBox key.
    ::: features
    finalinherited
    :::

[[currentOrg](../services_event_service/EventService/currentOrg.html)] [→ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)]
:   The event stream.
    ::: features
    no setter
    :::

[[eventStream](../services_event_service/EventService/eventStream.html)] [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]\>]]\>]]
:   The event stream.
    ::: features
    no setter
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[addVolunteerToGroup](../services_event_service/EventService/addVolunteerToGroup.html)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] variables]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   This function is used to add a volunteer to a group.

[[createAgendaItem](../services_event_service/EventService/createAgendaItem.html)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] variables]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   This function is used to create an agenda item.

[[createEvent](../services_event_service/EventService/createEvent.html)][({[required [[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] variables]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]] ]
:   This function is used to create an event using a GraphQL mutation.

[[createVolunteerGroup](../services_event_service/EventService/createVolunteerGroup.html)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] variables]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   This function is used to create a volunteer group.

[[deleteAgendaItem](../services_event_service/EventService/deleteAgendaItem.html)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] variables]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   This function is used to delete an agenda item.

[[deleteEvent](../services_event_service/EventService/deleteEvent.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] eventId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]] ]
:   This function is used to delete the event.

[dispose](../services_event_service/EventService/dispose.html) [→ void ]
:   This function is used to cancel the stream subscription of an
    organization.

[[editEvent](../services_event_service/EventService/editEvent.html)][({[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] eventId, ][required [[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] variables]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]] ]
:   This function is used to edit an event.

[[fetchAgendaCategories](../services_event_service/EventService/fetchAgendaCategories.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] orgId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   This function is used to create an agenda item.

[[fetchAgendaItems](../services_event_service/EventService/fetchAgendaItems.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] eventId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   This function is used to fetch all agenda items for a specific
    organization.

[[fetchAttendeesByEvent](../services_event_service/EventService/fetchAttendeesByEvent.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] eventId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   This function is used to fetch all registrants of an event.

[[fetchDataFromApi](../services_event_service/EventService/fetchDataFromApi.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]\>]]\>]] ]
:   Abstract method to be implemented by subclasses to fetch data from
    an API.
    ::: features
    override
    :::

[[fetchEventsInitial](../services_event_service/EventService/fetchEventsInitial.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Fetches the initial set of events, loading from the cache first, and
    then refreshing the feed.

[[fetchVolunteerGroupsByEvent](../services_event_service/EventService/fetchVolunteerGroupsByEvent.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] eventId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.html)]\>]]\>]] ]
:   This function is used to fetch all volunteer groups for an event.

[[getEvents](../services_event_service/EventService/getEvents.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function is used to fetch all the events of an organization.

[[getNewFeedAndRefreshCache](../services_caching_base_feed_manager/BaseFeedManager/getNewFeedAndRefreshCache.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]\>]]\>]] ]
:   Fetches new data from the API if online, updates the cache, and
    returns the data.
    ::: features
    inherited
    :::

[[loadCachedData](../services_caching_base_feed_manager/BaseFeedManager/loadCachedData.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]\>]]\>]] ]
:   Loads the data cached in Hive.
    ::: features
    inherited
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[refreshFeed](../services_event_service/EventService/refreshFeed.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Refreshes the event feed by fetching the latest events from the API
    and updating the event stream.

[[registerForAnEvent](../services_event_service/EventService/registerForAnEvent.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] eventId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   This function is used to register user for an event.

[[removeVolunteerFromGroup](../services_event_service/EventService/removeVolunteerFromGroup.html)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] variables]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   This function is used to remove a volunteer from a group.

[[removeVolunteerGroup](../services_event_service/EventService/removeVolunteerGroup.html)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] variables]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   This function is used to remove a volunteer group.

[[saveDataToCache](../services_caching_base_feed_manager/BaseFeedManager/saveDataToCache.html)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]\>]] data]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Saves a list of data to the cache, replacing any existing data.
    ::: features
    inherited
    :::

[setOrgStreamSubscription](../services_event_service/EventService/setOrgStreamSubscription.html) [→ void ]
:   This function is used to set stream subscription for an
    organization.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updateAgendaItem](../services_event_service/EventService/updateAgendaItem.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] itemId, ][[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] variables]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   This function is used to update an agenda item.

[[updateVolunteerGroup](../services_event_service/EventService/updateVolunteerGroup.html)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] variables]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   This function is used to update the information of a volunteer
    group.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [event_service](../services_event_service/)
3.  EventService class

##### event_service library







