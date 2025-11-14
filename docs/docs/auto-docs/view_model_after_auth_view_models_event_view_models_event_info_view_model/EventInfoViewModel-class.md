<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [event_info_view_model](../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.md)
3.  EventInfoViewModel class

<div class="self-name">

EventInfoViewModel

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library-sidebar.html"
below-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class-sidebar.html">

<div>

# <span class="kind-class">EventInfoViewModel</span> class

</div>

<div class="section desc markdown">

EventInfoViewModel class helps interacting with model to serve view with
the event information data.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- EventInfoViewModel

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[EventInfoViewModel](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/EventInfoViewModel.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[agendaItems](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/agendaItems.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem-class.md)</span>\></span></span>  
List of volunteer groups of an event.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[attendees](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/attendees.md)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Attendee](../models_events_event_model/Attendee-class.md)</span>\></span></span>  
List of Attendee type to store the attendees data.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[categories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/categories.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.md)</span>\></span></span>  
List of Agenda categories in an organisation.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[event](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/event.md)</span> <span class="signature">↔ [Event](../models_events_event_model/Event-class.md)</span>  
Event instance to store the event data.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[exploreEventsInstance](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/exploreEventsInstance.md)</span> <span class="signature">↔ [ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.md)</span>  
ExploreEventsViewModel instance to fetch the event data.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[fabTitle](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fabTitle.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
String type variable to store the FAB title.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[hasListeners](../view_model_base_view_model/BaseModel/hasListeners.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Whether any listeners are currently registered.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
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

<span class="name">[selectedCategories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/selectedCategories.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.md)</span>\></span></span>  
List of selected Agenda categories for an agenda item.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[state](../view_model_base_view_model/BaseModel/state.md)</span> <span class="signature">→ [ViewState](../enums_enums/ViewState.md)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[volunteerGroups](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/volunteerGroups.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.md)</span>\></span></span>  
List of volunteer groups of an event.

<div class="features">

<span class="feature">no setter</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addListener](../view_model_base_view_model/BaseModel/addListener.md)</span><span class="signature">(<span id="addListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Register a closure to be called when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[createAgendaItem](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/createAgendaItem.md)</span><span class="signature">(<span id="createAgendaItem-param-title" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem-class.md)?</span>\></span></span> </span>  
This function is used to create a new agenda item for an event.

<span class="name">[createVolunteerGroup](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/createVolunteerGroup.md)</span><span class="signature">(<span id="createVolunteerGroup-param-event" class="parameter"><span class="type-annotation">[Event](../models_events_event_model/Event-class.md)</span> <span class="parameter-name">event</span>, </span><span id="createVolunteerGroup-param-groupName" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">groupName</span>, </span><span id="createVolunteerGroup-param-volunteersRequired" class="parameter"><span class="type-annotation">[int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span> <span class="parameter-name">volunteersRequired</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.md)?</span>\></span></span> </span>  
This function is used to create a new volunteer group for an event.

<span class="name">[deleteAgendaItem](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/deleteAgendaItem.md)</span><span class="signature">(<span id="deleteAgendaItem-param-id" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">id</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Method to delete an agenda item.

<span class="name">[dispose](../view_model_base_view_model/BaseModel/dispose.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](../view_model_base_view_model/BaseModel/addListener.md)
will throw after the object is disposed).

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[fetchAgendaItems](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchAgendaItems.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Method to fetch all agenda items of an organization.

<span class="name">[fetchCategories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchCategories.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Method to fecth all agenda categories of an organisation.

<span class="name">[fetchVolunteerGroups](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchVolunteerGroups.md)</span><span class="signature">(<span id="fetchVolunteerGroups-param-eventId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">eventId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Fetches all volunteer groups for the current event.

<span class="name">[getFabTitle](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/getFabTitle.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
The funtion returns title to be displayed on Floating Action Button.

<span class="name">[initialize](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/initialize.md)</span><span class="signature">(<span id="initialize-param-args" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function initializes the EventInfoViewModel class with the required
arguments.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[notifyListeners](../view_model_base_view_model/BaseModel/notifyListeners.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Call all the registered listeners.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[registerForEvent](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/registerForEvent.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
The function allows user to register for an event.

<span class="name">[removeListener](../view_model_base_view_model/BaseModel/removeListener.md)</span><span class="signature">(<span id="removeListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Remove a previously registered closure from the list of closures that
are notified when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[reorderAgendaItems](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/reorderAgendaItems.md)</span><span class="signature">(<span id="reorderAgendaItems-param-oldIndex" class="parameter"><span class="type-annotation">[int](https://api.flutter.dev/flutter/dart-core/int-class.md)</span> <span class="parameter-name">oldIndex</span>, </span><span id="reorderAgendaItems-param-newIndex" class="parameter"><span class="type-annotation">[int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span> <span class="parameter-name">newIndex</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Method to redorder the sequence of agenda items.

<span class="name">[setSelectedCategories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/setSelectedCategories.md)</span><span class="signature">(<span id="setSelectedCategories-param-categories" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.md)</span>\></span></span> <span class="parameter-name">categories</span></span>) <span class="returntype parameter">→ void</span> </span>  
method to select multiple categories.

<span class="name">[setState](../view_model_base_view_model/BaseModel/setState.md)</span><span class="signature">(<span id="setState-param-viewState" class="parameter"><span class="type-annotation">[ViewState](../enums_enums/ViewState.md)</span> <span class="parameter-name">viewState</span></span>) <span class="returntype parameter">→ void</span> </span>  
<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[updateAgendaItemSequence](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/updateAgendaItemSequence.md)</span><span class="signature">(<span id="updateAgendaItemSequence-param-itemId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">itemId</span>, </span><span id="updateAgendaItemSequence-param-newSequence" class="parameter"><span class="type-annotation">[int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span> <span class="parameter-name">newSequence</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Method to update the sequence of an agenda item.

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
2.  [event_info_view_model](../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.md)
3.  EventInfoViewModel class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
