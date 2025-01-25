




ExploreEventsViewModel class - explore\_events\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/explore\_events\_view\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_explore_events_view_model/)
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

## Constructors

[ExploreEventsViewModel](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/ExploreEventsViewModel.html)({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) demoMode = false})




## Properties

[chosenValue](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/chosenValue.html)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

Getter method to retrieve the chosen value.
no setter

[demoMode](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/demoMode.html)
↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)

flag to check if the app is in demo mode.
getter/setter pair

[emptyListMessage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/emptyListMessage.html)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

Getter method to retrieve the empty list message.
no setter

[events](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/events.html)
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

Getter method to retrieve the list of events.
no setter

[eventService](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/eventService.html)
→ dynamic

Getter method to retrieve the EventService instance.
no setter

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited

[userEvents](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/userEvents.html)
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

Getter method to retrieve the list of User events.
no setter



## Methods

[checkIfExistsAndAddNewEvents](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/checkIfExistsAndAddNewEvents.html)([List](https://api.flutter.dev/flutter/dart-core/List-class.html) newEvents)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function add a new event if the event not exist.

[choseValueFromDropdown](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/choseValueFromDropdown.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) value)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function takes the choosen value from dropdown and return the filter events, if empty list then return relevant message.

[deleteEvent](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/deleteEvent.html)({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function deletes the event.

[dispose](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/dispose.html)()
→ void



[fetchNewEvents](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/fetchNewEvents.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function is used to fetch new events in the organization.

[initialise](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/initialise.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


initialiser.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[refreshEvents](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/refreshEvents.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function is used to refresh the events in the organization.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [explore\_events\_view\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_explore_events_view_model/)
3. ExploreEventsViewModel class

##### explore\_events\_view\_model library





talawa
1.0.0+1






