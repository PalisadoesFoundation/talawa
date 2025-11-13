<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [models/events/event_model.dart](../models_events_event_model/models_events_event_model-library.md)
3.  Event class

<div class="self-name">

Event

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="models_events_event_model/models_events_event_model-library-sidebar.html"
below-sidebar="models_events_event_model/Event-class-sidebar.html">

<div>

# <span class="kind-class">Event</span> class

</div>

<div class="section desc markdown">

This class creates an event model and returns an Event instance.

</div>

<div class="section">

Annotations  
- @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId:
  10)

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[Event](../models_events_event_model/Event/Event.md)</span><span class="signature"></span>  

<span class="name">[Event.fromJson](../models_events_event_model/Event/Event.fromJson.md)</span><span class="signature">(<span id="fromJson-param-json" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">json</span></span>)</span>  
<div class="constructor-modifier features">

factory

</div>

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[admins](../models_events_event_model/Event/admins.md)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[User](../models_user_user_info/User-class.md)</span>\></span>?</span>  
The admins of the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[allDay](../models_events_event_model/Event/allDay.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?</span>  
A boolean value that indicates if the event is an all-day event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[attendees](../models_events_event_model/Event/attendees.md)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Attendee](../models_events_event_model/Attendee-class.md)</span>\></span>?</span>  
The attendees of the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[creator](../models_events_event_model/Event/creator.md)</span> <span class="signature">↔ [User](../models_user_user_info/User-class.md)?</span>  
The creator of the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[description](../models_events_event_model/Event/description.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The description of the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[endAt](../models_events_event_model/Event/endAt.md)</span> <span class="signature">↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?</span>  
The end DateTime of the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[endDate](../models_events_event_model/Event/endDate.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
Computed property: formatted end date (e.g. "2025-07-31").

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[endTime](../models_events_event_model/Event/endTime.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
Computed property: formatted end time (e.g. "05:00 PM").

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[id](../models_events_event_model/Event/id.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
Unique identifier for the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[isPublic](../models_events_event_model/Event/isPublic.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?</span>  
A boolean value that indicates if the event is public.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[isRegisterable](../models_events_event_model/Event/isRegisterable.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?</span>  
A boolean value that indicates if the event is registerable.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[isRegistered](../models_events_event_model/Event/isRegistered.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?</span>  
A boolean value that indicates if the user is registered for the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[location](../models_events_event_model/Event/location.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The location of the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[name](../models_events_event_model/Event/name.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The title of the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[organization](../models_events_event_model/Event/organization.md)</span> <span class="signature">↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.md)?</span>  
The organization of the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[recurring](../models_events_event_model/Event/recurring.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?</span>  
A boolean value that indicates if the event is recurring.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[startAt](../models_events_event_model/Event/startAt.md)</span> <span class="signature">↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?</span>  
The start DateTime of the event.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[startDate](../models_events_event_model/Event/startDate.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
Computed property: formatted start date (e.g. "2025-07-30").

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[startTime](../models_events_event_model/Event/startTime.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
Computed property: formatted start time (e.g. "09:00 AM").

<div class="features">

<span class="feature">no setter</span>

</div>

</div>

<div id="instance-methods"
class="section summary offset-anchor inherited">

## Methods

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

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
2.  [event_model](../models_events_event_model/models_events_event_model-library.md)
3.  Event class

##### event_model library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
