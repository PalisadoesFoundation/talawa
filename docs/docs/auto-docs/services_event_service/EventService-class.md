<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [event_service](../services_event_service/services_event_service-library.md)
3.  EventService class

<div class="self-name">

EventService

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_event_service/services_event_service-library-sidebar.html"
below-sidebar="services_event_service/EventService-class-sidebar.html">

<div>

# <span class="kind-class">EventService</span> class

</div>

<div class="section desc markdown">

EventService class provides different services in the context of Event.

Services include:

- `setOrgStreamSubscription` : to set organization stream subscription
  for user.
- `getEvents` : to get all events of the organization.
- `fetchAttendeesByEvent` : to fetch all attendees of an event.
- `registerForAnEvent` : to register for an event.
- `deleteEvent` : to delete an event.
- `editEvent` : to edit the event.
- `fetchEventVolunteers` : to fetch all volunteers of an event.
- `createVolunteerGroup` : to create a volunteer group.
- `addVolunteerToGroup` : to add a volunteer to a group.
- `dispose` : to cancel the stream subscription of an organization.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [BaseFeedManager](../services_caching_base_feed_manager/BaseFeedManager-class.md)<span class="signature">\<<span class="type-parameter">[Event](../models_events_event_model/Event-class.md)</span>\></span>
- EventService

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[EventService](../services_event_service/EventService/EventService.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[after](../services_event_service/EventService/after.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The after cursor for pagination.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
feed cacheBox key.

<div class="features">

<span class="feature">final</span><span class="feature">inherited</span>

</div>

<span class="name">[currentOrg](../services_event_service/EventService/currentOrg.md)</span> <span class="signature">→ [OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>  
The event stream.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[events](../services_event_service/EventService/events.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Event](../models_events_event_model/Event-class.md)</span>\></span></span>  
Getter for list of events.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[eventStream](../services_event_service/EventService/eventStream.md)</span> <span class="signature">→ [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Event](../models_events_event_model/Event-class.md)</span>\></span></span>\></span></span>  
The event stream.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[first](../services_event_service/EventService/first.md)</span> <span class="signature">↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?</span>  
The first number of events to fetch.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[hasMoreEvents](../services_event_service/EventService/hasMoreEvents.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Getter to check if there are more events to fetch.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[pageInfo](../services_event_service/EventService/pageInfo.md)</span> <span class="signature">↔ [PageInfo](../models_page_info_page_info/PageInfo-class.md)</span>  
page info for the events.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addVolunteerToGroup](../services_event_service/EventService/addVolunteerToGroup.md)</span><span class="signature">(<span id="addVolunteerToGroup-param-variables" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">variables</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)</span> </span>  
This function is used to add a volunteer to a group.

<span class="name">[createAgendaItem](../services_event_service/EventService/createAgendaItem.md)</span><span class="signature">(<span id="createAgendaItem-param-variables" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">variables</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)</span> </span>  
This function is used to create an agenda item.

<span class="name">[createEvent](../services_event_service/EventService/createEvent.md)</span><span class="signature">(<span id="createEvent-param-variables" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span> </span>  
This function is used to create an event using a GraphQL mutation.

<span class="name">[createVolunteerGroup](../services_event_service/EventService/createVolunteerGroup.md)</span><span class="signature">(<span id="createVolunteerGroup-param-variables" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">variables</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)</span> </span>  
This function is used to create a volunteer group.

<span class="name">[deleteAgendaItem](../services_event_service/EventService/deleteAgendaItem.md)</span><span class="signature">(<span id="deleteAgendaItem-param-variables" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">variables</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)</span> </span>  
This function is used to delete an agenda item.

<span class="name">[deleteEvent](../services_event_service/EventService/deleteEvent.md)</span><span class="signature">(<span id="deleteEvent-param-eventId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">eventId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span> </span>  
This function is used to delete the event.

<span class="name">[dispose](../services_event_service/EventService/dispose.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This function is used to cancel the stream subscription of an
organization.

<span class="name">[editEvent](../services_event_service/EventService/editEvent.md)</span><span class="signature">(<span id="editEvent-param-eventId" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span> </span>  
This function is used to edit an event.

<span class="name">[fetchAgendaCategories](../services_event_service/EventService/fetchAgendaCategories.md)</span><span class="signature">(<span id="fetchAgendaCategories-param-orgId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">orgId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)</span> </span>  
This function is used to create an agenda item.

<span class="name">[fetchAgendaItems](../services_event_service/EventService/fetchAgendaItems.md)</span><span class="signature">(<span id="fetchAgendaItems-param-eventId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">eventId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)</span> </span>  
This function is used to fetch all agenda items for a specific
organization.

<span class="name">[fetchAttendeesByEvent](../services_event_service/EventService/fetchAttendeesByEvent.md)</span><span class="signature">(<span id="fetchAttendeesByEvent-param-eventId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">eventId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)</span> </span>  
This function is used to fetch all registrants of an event.

<span class="name">[fetchDataFromApi](../services_event_service/EventService/fetchDataFromApi.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Event](../models_events_event_model/Event-class.md)</span>\></span></span>\></span></span> </span>  
Abstract method to be implemented by subclasses to fetch data from an
API.

<div class="features">

<span class="feature">override</span>

</div>

<span class="name">[fetchEventsInitial](../services_event_service/EventService/fetchEventsInitial.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Fetches the initial set of events, loading from the cache first, and
then refreshing the feed.

<span class="name">[fetchVolunteerGroupsByEvent](../services_event_service/EventService/fetchVolunteerGroupsByEvent.md)</span><span class="signature">(<span id="fetchVolunteerGroupsByEvent-param-eventId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">eventId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.md)</span>\></span></span>\></span></span> </span>  
This function is used to fetch all volunteer groups for an event.

<span class="name">[getEvents](../services_event_service/EventService/getEvents.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function is used to fetch all the events of an organization.

<span class="name">[getNewFeedAndRefreshCache](../services_caching_base_feed_manager/BaseFeedManager/getNewFeedAndRefreshCache.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Event](../models_events_event_model/Event-class.md)</span>\></span></span>\></span></span> </span>  
Fetches new data from the API if online, updates the cache, and returns
the data.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[loadCachedData](../services_caching_base_feed_manager/BaseFeedManager/loadCachedData.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Event](../models_events_event_model/Event-class.md)</span>\></span></span>\></span></span> </span>  
Loads the data cached in Hive.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[refreshFeed](../services_event_service/EventService/refreshFeed.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Refreshes the event feed by fetching the latest events from the API and
updating the event stream.

<span class="name">[registerForAnEvent](../services_event_service/EventService/registerForAnEvent.md)</span><span class="signature">(<span id="registerForAnEvent-param-eventId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">eventId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)</span> </span>  
This function is used to register user for an event.

<span class="name">[removeVolunteerFromGroup](../services_event_service/EventService/removeVolunteerFromGroup.md)</span><span class="signature">(<span id="removeVolunteerFromGroup-param-variables" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">variables</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)</span> </span>  
This function is used to remove a volunteer from a group.

<span class="name">[removeVolunteerGroup](../services_event_service/EventService/removeVolunteerGroup.md)</span><span class="signature">(<span id="removeVolunteerGroup-param-variables" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">variables</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)</span> </span>  
This function is used to remove a volunteer group.

<span class="name">[saveDataToCache](../services_caching_base_feed_manager/BaseFeedManager/saveDataToCache.md)</span><span class="signature">(<span id="saveDataToCache-param-data" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[Event](../models_events_event_model/Event-class.md)</span>\></span></span> <span class="parameter-name">data</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Saves a list of data to the cache, replacing any existing data.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[setOrgStreamSubscription](../services_event_service/EventService/setOrgStreamSubscription.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This function is used to set stream subscription for an organization.

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[updateAgendaItem](../services_event_service/EventService/updateAgendaItem.md)</span><span class="signature">(<span id="updateAgendaItem-param-itemId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">itemId</span>, </span><span id="updateAgendaItem-param-variables" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">variables</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)</span> </span>  
This function is used to update an agenda item.

<span class="name">[updateVolunteerGroup](../services_event_service/EventService/updateVolunteerGroup.md)</span><span class="signature">(<span id="updateVolunteerGroup-param-variables" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">variables</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)</span> </span>  
This function is used to update the information of a volunteer group.

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [event_service](../services_event_service/services_event_service-library.md)
3.  EventService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
