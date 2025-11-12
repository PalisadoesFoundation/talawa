<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [models/events/event_agenda_item.dart](../models_events_event_agenda_item/)
3.  EventAgendaItem class

<div class="self-name">

EventAgendaItem

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="models_events_event_agenda_item/models_events_event_agenda_item-library-sidebar.html"
below-sidebar="models_events_event_agenda_item/EventAgendaItem-class-sidebar.html">

<div>

# <span class="kind-class">EventAgendaItem</span> class

</div>

<div class="section desc markdown">

Model for Event Agenda Item.

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem/EventAgendaItem.md)</span><span class="signature"></span>  

<span class="name">[EventAgendaItem.fromJson](../models_events_event_agenda_item/EventAgendaItem/EventAgendaItem.fromJson.md)</span><span class="signature">(<span id="fromJson-param-json" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">json</span></span>)</span>  
<div class="constructor-modifier features">

factory

</div>

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[attachments](../models_events_event_agenda_item/EventAgendaItem/attachments.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>\></span>?</span>  
Optional array of attachment URLs.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[categories](../models_events_event_agenda_item/EventAgendaItem/categories.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.md)</span>\></span>?</span>  
Optional array of agenda categories.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[createdBy](../models_events_event_agenda_item/EventAgendaItem/createdBy.md)</span> <span class="signature">→ [User](../models_user_user_info/User-class.md)?</span>  
Reference to the user who created the agenda item.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[description](../models_events_event_agenda_item/EventAgendaItem/description.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
Optional description.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[duration](../models_events_event_agenda_item/EventAgendaItem/duration.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
Duration of the agenda item.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[id](../models_events_event_agenda_item/EventAgendaItem/id.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
Unique identifier for the agenda item.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[organization](../models_events_event_agenda_item/EventAgendaItem/organization.md)</span> <span class="signature">→ [OrgInfo](../models_organization_org_info/OrgInfo-class.md)?</span>  
Reference to the organization associated with the agenda item.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[relatedEvent](../models_events_event_agenda_item/EventAgendaItem/relatedEvent.md)</span> <span class="signature">→ [Event](../models_events_event_model/Event-class.md)?</span>  
Reference to the event associated with the agenda item.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[sequence](../models_events_event_agenda_item/EventAgendaItem/sequence.md)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?</span>  
Sequence number of the agenda item.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[title](../models_events_event_agenda_item/EventAgendaItem/title.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
Title of the agenda item.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[urls](../models_events_event_agenda_item/EventAgendaItem/urls.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>\></span>?</span>  
Optional array of URLs related to the agenda item.

<div class="features">

<span class="feature">final</span>

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
2.  [event_agenda_item](../models_events_event_agenda_item/)
3.  EventAgendaItem class

##### event_agenda_item library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
