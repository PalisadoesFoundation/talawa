::::::::: {#dartdoc-main-content .main-content above-sidebar="utils_event_queries/utils_event_queries-library-sidebar.html" below-sidebar="utils_event_queries/EventQueries-class-sidebar.html"}
<div>

# [EventQueries]{.kind-class} class

</div>

::: {.section .desc .markdown}
This class creates queries related to the events.
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[EventQueries](../utils_event_queries/EventQueries/EventQueries.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor .inherited}
## Properties

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

[[addEvent](../utils_event_queries/EventQueries/addEvent.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Creates a GraphQL mutation for adding an event.

[[addVolunteerToGroup](../utils_event_queries/EventQueries/addVolunteerToGroup.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Creates a GraphQL mutation for adding a volunteer to a group.

[[attendeesByEvent](../utils_event_queries/EventQueries/attendeesByEvent.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [eventId]{.parameter-name}]{#attendeesByEvent-param-eventId .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Fetches attendees by event ID.

[[createAgendaItem](../utils_event_queries/EventQueries/createAgendaItem.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Creates a GraphQL mutation for creating an agenda item.

[[createVolunteerGroup](../utils_event_queries/EventQueries/createVolunteerGroup.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Creates a GraphQL mutation for creating an event volunteer group.

[[deleteAgendaItem](../utils_event_queries/EventQueries/deleteAgendaItem.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Creates a GraphQL mutation for deleting an agenda item.

[[deleteEvent](../utils_event_queries/EventQueries/deleteEvent.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [id]{.parameter-name}]{#deleteEvent-param-id .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Creates a GraphQL mutation for deleting an event.

[[fetchAgendaItemCategoriesByOrganization](../utils_event_queries/EventQueries/fetchAgendaItemCategoriesByOrganization.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [organizationId]{.parameter-name}]{#fetchAgendaItemCategoriesByOrganization-param-organizationId .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Creates a GraphQL query for fetching agenda item categories by
    organization.

[[fetchAgendaItemsByEvent](../utils_event_queries/EventQueries/fetchAgendaItemsByEvent.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [relatedEventId]{.parameter-name}]{#fetchAgendaItemsByEvent-param-relatedEventId .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Creates a GraphQL query for fetching agenda items by organization.

[[fetchOrgEvents](../utils_event_queries/EventQueries/fetchOrgEvents.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [orgId]{.parameter-name}]{#fetchOrgEvents-param-orgId .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Fetches events by organization ID.

[[fetchVolunteerGroups](../utils_event_queries/EventQueries/fetchVolunteerGroups.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Fetches event volunteer groups based on criteria such as event ID.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[registerForEvent](../utils_event_queries/EventQueries/registerForEvent.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Creates a GraphQL mutation for registering for an event.

[[removeEventVolunteerGroup](../utils_event_queries/EventQueries/removeEventVolunteerGroup.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Creates a GraphQL mutation for removing an event volunteer group.

[[removeVolunteerMutation](../utils_event_queries/EventQueries/removeVolunteerMutation.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Creates a GraphQL mutation for deleting a volunteer from a group.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[updateAgendaItem](../utils_event_queries/EventQueries/updateAgendaItem.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Creates a GraphQL mutation for updating an agenda item.

[[updateEvent](../utils_event_queries/EventQueries/updateEvent.html)]{.name}[({[[dynamic]{.type-annotation} [eventId]{.parameter-name}]{#updateEvent-param-eventId .parameter}}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Creates a GraphQL mutation for updating an event.

[[updateVolunteerGroupMutation](../utils_event_queries/EventQueries/updateVolunteerGroupMutation.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Mutation to update volunteer group insatnce.
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [event_queries](../utils_event_queries/)
3.  EventQueries class

##### event_queries library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
