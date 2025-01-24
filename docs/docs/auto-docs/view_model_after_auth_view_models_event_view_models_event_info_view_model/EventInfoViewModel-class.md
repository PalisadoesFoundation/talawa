




EventInfoViewModel class - event\_info\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_info\_view\_model.dart](../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.html)
3. EventInfoViewModel class

EventInfoViewModel


dark\_mode

light\_mode




# EventInfoViewModel class


EventInfoViewModel class helps interacting with model to serve view with the event information data.


Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* EventInfoViewModel



## Constructors

[EventInfoViewModel](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/EventInfoViewModel.html)()




## Properties

[agendaItems](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/agendaItems.html)
→ List<[EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem-class.html)>

List of volunteer groups of an event.
no setter

[attendees](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/attendees.html)
↔ List<[Attendee](../models_events_event_model/Attendee-class.html)>

List of Attendee type to store the attendees data.
getter/setter pair

[categories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/categories.html)
→ List<[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)>

List of Agenda categories in an organisation.
no setter

[event](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/event.html)
↔ [Event](../models_events_event_model/Event-class.html)

Event instance to store the event data.
getter/setter pair

[exploreEventsInstance](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/exploreEventsInstance.html)
↔ [ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)

ExploreEventsViewModel instance to fetch the event data.
getter/setter pair

[fabTitle](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fabTitle.html)
↔ String

String type variable to store the FAB title.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/foundation/Listenable/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)
→ bool

Whether any listeners are currently registered.
no setterinherited

[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)
→ bool

no setterinherited

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[selectedCategories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/selectedCategories.html)
→ List<[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)>

List of selected Agenda categories for an agenda item.
no setter

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited

[volunteerGroups](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/volunteerGroups.html)
→ List<[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.html)>

List of volunteer groups of an event.
no setter



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[createAgendaItem](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/createAgendaItem.html)({required String title, String? description, required String duration, List<String>? attachments, List<String>? urls, List<String>? categories, int? sequence})
→ Future<[EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem-class.html)?>


This function is used to create a new agenda item for an event.

[createVolunteerGroup](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/createVolunteerGroup.html)([Event](../models_events_event_model/Event-class.html) event, String groupName, int volunteersRequired)
→ Future<[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.html)?>


This function is used to create a new volunteer group for an event.

[deleteAgendaItem](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/deleteAgendaItem.html)(String id)
→ Future<void>


Method to delete an agenda item.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
inherited

[fetchAgendaItems](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchAgendaItems.html)()
→ Future<void>


Method to fetch all agenda items of an organization.

[fetchCategories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchCategories.html)()
→ Future<void>


Method to fecth all agenda categories of an organisation.

[fetchVolunteerGroups](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchVolunteerGroups.html)(String eventId)
→ Future<void>


Fetches all volunteer groups for the current event.

[getFabTitle](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/getFabTitle.html)()
→ String


The funtion returns title to be displayed on Floating Action Button.

[initialize](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/initialize.html)({required Map<String, dynamic> args})
→ Future<void>


This function initializes the EventInfoViewModel class with the required arguments.

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[registerForEvent](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/registerForEvent.html)()
→ Future<void>


The function allows user to register for an event.

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[reorderAgendaItems](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/reorderAgendaItems.html)(int oldIndex, int newIndex)
→ Future<void>


Method to redorder the sequence of agenda items.

[setSelectedCategories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/setSelectedCategories.html)(List<[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)> categories)
→ void


method to select multiple categories.

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited

[updateAgendaItemSequence](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/updateAgendaItemSequence.html)(String itemId, int newSequence)
→ Future<void>


Method to update the sequence of an agenda item.



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [event\_info\_view\_model](../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.html)
3. EventInfoViewModel class

##### event\_info\_view\_model library





talawa
1.0.0+1






