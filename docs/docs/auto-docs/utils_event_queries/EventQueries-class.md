<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [utils/event_queries.dart](../utils_event_queries/utils_event_queries-library.md)
3.  EventQueries class

<div class="self-name">

EventQueries

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_event_queries/utils_event_queries-library-sidebar.html"
below-sidebar="utils_event_queries/EventQueries-class-sidebar.html">

<div>

# <span class="kind-class">EventQueries</span> class

</div>

<div class="section desc markdown">

This class creates queries related to the events.

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[EventQueries](../utils_event_queries/EventQueries/EventQueries.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties"
class="section summary offset-anchor inherited">

## Properties

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

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

<span class="name">[addEvent](../utils_event_queries/EventQueries/addEvent.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Creates a GraphQL mutation for adding an event.

<span class="name">[addVolunteerToGroup](../utils_event_queries/EventQueries/addVolunteerToGroup.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Creates a GraphQL mutation for adding a volunteer to a group.

<span class="name">[attendeesByEvent](../utils_event_queries/EventQueries/attendeesByEvent.md)</span><span class="signature">(<span id="attendeesByEvent-param-eventId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">eventId</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Fetches attendees by event ID.

<span class="name">[createAgendaItem](../utils_event_queries/EventQueries/createAgendaItem.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Creates a GraphQL mutation for creating an agenda item.

<span class="name">[createVolunteerGroup](../utils_event_queries/EventQueries/createVolunteerGroup.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Creates a GraphQL mutation for creating an event volunteer group.

<span class="name">[deleteAgendaItem](../utils_event_queries/EventQueries/deleteAgendaItem.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Creates a GraphQL mutation for deleting an agenda item.

<span class="name">[deleteEvent](../utils_event_queries/EventQueries/deleteEvent.md)</span><span class="signature">(<span id="deleteEvent-param-id" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">id</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Creates a GraphQL mutation for deleting an event.

<span class="name">[fetchAgendaItemCategoriesByOrganization](../utils_event_queries/EventQueries/fetchAgendaItemCategoriesByOrganization.md)</span><span class="signature">(<span id="fetchAgendaItemCategoriesByOrganization-param-organizationId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">organizationId</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Creates a GraphQL query for fetching agenda item categories by
organization.

<span class="name">[fetchAgendaItemsByEvent](../utils_event_queries/EventQueries/fetchAgendaItemsByEvent.md)</span><span class="signature">(<span id="fetchAgendaItemsByEvent-param-relatedEventId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">relatedEventId</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Creates a GraphQL query for fetching agenda items by organization.

<span class="name">[fetchOrgEvents](../utils_event_queries/EventQueries/fetchOrgEvents.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Fetches events by organization ID.

<span class="name">[fetchVolunteerGroups](../utils_event_queries/EventQueries/fetchVolunteerGroups.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Fetches event volunteer groups based on criteria such as event ID.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[registerForEvent](../utils_event_queries/EventQueries/registerForEvent.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Creates a GraphQL mutation for registering for an event.

<span class="name">[removeEventVolunteerGroup](../utils_event_queries/EventQueries/removeEventVolunteerGroup.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Creates a GraphQL mutation for removing an event volunteer group.

<span class="name">[removeVolunteerMutation](../utils_event_queries/EventQueries/removeVolunteerMutation.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Creates a GraphQL mutation for deleting a volunteer from a group.

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[updateAgendaItem](../utils_event_queries/EventQueries/updateAgendaItem.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Creates a GraphQL mutation for updating an agenda item.

<span class="name">[updateEvent](../utils_event_queries/EventQueries/updateEvent.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Creates a GraphQL mutation for updating an event.

<span class="name">[updateVolunteerGroupMutation](../utils_event_queries/EventQueries/updateVolunteerGroupMutation.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Mutation to update volunteer group insatnce.

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
2.  [event_queries](../utils_event_queries/utils_event_queries-library.md)
3.  EventQueries class

##### event_queries library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
