




ExploreEventsViewModel class - explore\_events\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/explore\_events\_view\_model.dart](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/view_model_after_auth_view_models_event_view_models_explore_events_view_model-library.html)
3. ExploreEventsViewModel class

ExploreEventsViewModel


dark\_mode

light\_mode




# ExploreEventsViewModel class


ExploreEventsViewModel class helps to interact with model to serve data to view for event explore section.

Methods include:

* `fetchNewEvents` : to fetch new events in the organization.
* `refreshEvents` : to refersh the event.
* `checkIfExistsAndAddNewEvent` : to check if the event exists or not, if now add a new event.
* `deleteEvent` : to delete the event.
* `choseValueFromDropdown` : to return the relevant message in the dropdown after any action.

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* ExploreEventsViewModel



## Constructors

[ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/ExploreEventsViewModel.html)({bool demoMode = false})




## Properties

[chosenValue](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/chosenValue.html)
→ String

Getter method to retrieve the chosen value.
no setter

[demoMode](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/demoMode.html)
↔ bool

flag to check if the app is in demo mode.
getter/setter pair

[emptyListMessage](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/emptyListMessage.html)
→ String

Getter method to retrieve the empty list message.
no setter

[events](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/events.html)
→ List<[Event](../models_events_event_model/Event-class.html)>

Getter method to retrieve the list of events.
no setter

[eventService](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/eventService.html)
→ [EventService](../services_event_service/EventService-class.html)

Getter method to retrieve the EventService instance.
no setter

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

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited

[userEvents](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/userEvents.html)
→ List<[Event](../models_events_event_model/Event-class.html)>

Getter method to retrieve the list of User events.
no setter



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[checkIfExistsAndAddNewEvents](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/checkIfExistsAndAddNewEvents.html)(List<[Event](../models_events_event_model/Event-class.html)> newEvents)
→ Future<void>


This function add a new event if the event not exist.

[choseValueFromDropdown](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/choseValueFromDropdown.html)(String value)
→ Future<void>


This function takes the choosen value from dropdown and return the filter events, if empty list then return relevant message.

[deleteEvent](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/deleteEvent.html)({required String eventId})
→ Future<void>


This function deletes the event.

[dispose](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
override

[fetchNewEvents](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/fetchNewEvents.html)()
→ Future<void>


This function is used to fetch new events in the organization.

[initialise](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/initialise.html)()
→ Future<void>


initialiser.

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[refreshEvents](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/refreshEvents.html)()
→ Future<void>


This function is used to refresh the events in the organization.

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [explore\_events\_view\_model](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/view_model_after_auth_view_models_event_view_models_explore_events_view_model-library.html)
3. ExploreEventsViewModel class

##### explore\_events\_view\_model library





talawa
1.0.0+1






