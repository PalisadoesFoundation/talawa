::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [services/event_service.dart](../services_event_service/)
3.  EventService class

::: self-name
EventService
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/services_event_service-library-sidebar.html" below-sidebar="services_event_service/EventService-class-sidebar.html"}
<div>

# [EventService]{.kind-class} class

</div>

::: {.section .desc .markdown}
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
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [BaseFeedManager](../services_caching_base_feed_manager/BaseFeedManager-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]{.type-parameter}\>]{.signature}
    -   EventService
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[EventService](../services_event_service/EventService/EventService.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   feed cacheBox key.
    ::: features
    [final]{.feature}[inherited]{.feature}
    :::

[[currentOrg](../services_event_service/EventService/currentOrg.html)]{.name} [→ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.signature}
:   The event stream.
    ::: features
    [no setter]{.feature}
    :::

[[eventStream](../services_event_service/EventService/eventStream.html)]{.name} [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   The event stream.
    ::: features
    [no setter]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addVolunteerToGroup](../services_event_service/EventService/addVolunteerToGroup.html)]{.name}[([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [variables]{.parameter-name}]{#addVolunteerToGroup-param-variables .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   This function is used to add a volunteer to a group.

[[createAgendaItem](../services_event_service/EventService/createAgendaItem.html)]{.name}[([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [variables]{.parameter-name}]{#createAgendaItem-param-variables .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   This function is used to create an agenda item.

[[createEvent](../services_event_service/EventService/createEvent.html)]{.name}[({[required [[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [variables]{.parameter-name}]{#createEvent-param-variables .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to create an event using a GraphQL mutation.

[[createVolunteerGroup](../services_event_service/EventService/createVolunteerGroup.html)]{.name}[([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [variables]{.parameter-name}]{#createVolunteerGroup-param-variables .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   This function is used to create a volunteer group.

[[deleteAgendaItem](../services_event_service/EventService/deleteAgendaItem.html)]{.name}[([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [variables]{.parameter-name}]{#deleteAgendaItem-param-variables .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   This function is used to delete an agenda item.

[[deleteEvent](../services_event_service/EventService/deleteEvent.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [eventId]{.parameter-name}]{#deleteEvent-param-eventId .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to delete the event.

[[dispose](../services_event_service/EventService/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This function is used to cancel the stream subscription of an
    organization.

[[editEvent](../services_event_service/EventService/editEvent.html)]{.name}[({[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [eventId]{.parameter-name}, ]{#editEvent-param-eventId .parameter}[required [[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [variables]{.parameter-name}]{#editEvent-param-variables .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to edit an event.

[[fetchAgendaCategories](../services_event_service/EventService/fetchAgendaCategories.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [orgId]{.parameter-name}]{#fetchAgendaCategories-param-orgId .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   This function is used to create an agenda item.

[[fetchAgendaItems](../services_event_service/EventService/fetchAgendaItems.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [eventId]{.parameter-name}]{#fetchAgendaItems-param-eventId .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   This function is used to fetch all agenda items for a specific
    organization.

[[fetchAttendeesByEvent](../services_event_service/EventService/fetchAttendeesByEvent.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [eventId]{.parameter-name}]{#fetchAttendeesByEvent-param-eventId .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   This function is used to fetch all registrants of an event.

[[fetchDataFromApi](../services_event_service/EventService/fetchDataFromApi.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Abstract method to be implemented by subclasses to fetch data from
    an API.
    ::: features
    [override]{.feature}
    :::

[[fetchEventsInitial](../services_event_service/EventService/fetchEventsInitial.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Fetches the initial set of events, loading from the cache first, and
    then refreshing the feed.

[[fetchVolunteerGroupsByEvent](../services_event_service/EventService/fetchVolunteerGroupsByEvent.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [eventId]{.parameter-name}]{#fetchVolunteerGroupsByEvent-param-eventId .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to fetch all volunteer groups for an event.

[[getEvents](../services_event_service/EventService/getEvents.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to fetch all the events of an organization.

[[getNewFeedAndRefreshCache](../services_caching_base_feed_manager/BaseFeedManager/getNewFeedAndRefreshCache.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Fetches new data from the API if online, updates the cache, and
    returns the data.
    ::: features
    [inherited]{.feature}
    :::

[[loadCachedData](../services_caching_base_feed_manager/BaseFeedManager/loadCachedData.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Loads the data cached in Hive.
    ::: features
    [inherited]{.feature}
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[refreshFeed](../services_event_service/EventService/refreshFeed.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Refreshes the event feed by fetching the latest events from the API
    and updating the event stream.

[[registerForAnEvent](../services_event_service/EventService/registerForAnEvent.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [eventId]{.parameter-name}]{#registerForAnEvent-param-eventId .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   This function is used to register user for an event.

[[removeVolunteerFromGroup](../services_event_service/EventService/removeVolunteerFromGroup.html)]{.name}[([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [variables]{.parameter-name}]{#removeVolunteerFromGroup-param-variables .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   This function is used to remove a volunteer from a group.

[[removeVolunteerGroup](../services_event_service/EventService/removeVolunteerGroup.html)]{.name}[([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [variables]{.parameter-name}]{#removeVolunteerGroup-param-variables .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   This function is used to remove a volunteer group.

[[saveDataToCache](../services_caching_base_feed_manager/BaseFeedManager/saveDataToCache.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [data]{.parameter-name}]{#saveDataToCache-param-data .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Saves a list of data to the cache, replacing any existing data.
    ::: features
    [inherited]{.feature}
    :::

[[setOrgStreamSubscription](../services_event_service/EventService/setOrgStreamSubscription.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This function is used to set stream subscription for an
    organization.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[updateAgendaItem](../services_event_service/EventService/updateAgendaItem.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [itemId]{.parameter-name}, ]{#updateAgendaItem-param-itemId .parameter}[[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [variables]{.parameter-name}]{#updateAgendaItem-param-variables .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   This function is used to update an agenda item.

[[updateVolunteerGroup](../services_event_service/EventService/updateVolunteerGroup.html)]{.name}[([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [variables]{.parameter-name}]{#updateVolunteerGroup-param-variables .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   This function is used to update the information of a volunteer
    group.
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [event_service](../services_event_service/)
3.  EventService class

##### event_service library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
