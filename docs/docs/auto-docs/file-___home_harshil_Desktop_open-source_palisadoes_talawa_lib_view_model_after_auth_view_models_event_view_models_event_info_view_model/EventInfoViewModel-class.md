




EventInfoViewModel class - event\_info\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_info\_view\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3. EventInfoViewModel class

EventInfoViewModel


dark\_mode

light\_mode




# EventInfoViewModel class


EventInfoViewModel class helps interacting with model to serve view with the event information data.


## Constructors

[EventInfoViewModel](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/EventInfoViewModel.html)()




## Properties

[agendaItems](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/agendaItems.html)
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

List of volunteer groups of an event.
no setter

[attendees](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/attendees.html)
↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

List of Attendee type to store the attendees data.
getter/setter pair

[categories](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/categories.html)
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

List of Agenda categories in an organisation.
no setter

[event](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/event.html)
↔ dynamic

Event instance to store the event data.
getter/setter pair

[exploreEventsInstance](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/exploreEventsInstance.html)
↔ dynamic

ExploreEventsViewModel instance to fetch the event data.
getter/setter pair

[fabTitle](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fabTitle.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

String type variable to store the FAB title.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited

[selectedCategories](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/selectedCategories.html)
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

List of selected Agenda categories for an agenda item.
no setter

[volunteerGroups](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/volunteerGroups.html)
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

List of volunteer groups of an event.
no setter



## Methods

[createAgendaItem](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/createAgendaItem.html)({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) title, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? description, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) duration, [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html)>? attachments, [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html)>? urls, [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html)>? categories, [int](https://api.flutter.dev/flutter/dart-core/int-class.html)? sequence})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to create a new agenda item for an event.

[createVolunteerGroup](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/createVolunteerGroup.html)(dynamic event, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) groupName, [int](https://api.flutter.dev/flutter/dart-core/int-class.html) volunteersRequired)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to create a new volunteer group for an event.

[deleteAgendaItem](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/deleteAgendaItem.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) id)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Method to delete an agenda item.

[fetchAgendaItems](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchAgendaItems.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Method to fetch all agenda items of an organization.

[fetchCategories](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchCategories.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Method to fecth all agenda categories of an organisation.

[fetchVolunteerGroups](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchVolunteerGroups.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Fetches all volunteer groups for the current event.

[getFabTitle](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/getFabTitle.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


The funtion returns title to be displayed on Floating Action Button.

[initialize](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/initialize.html)({required [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> args})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function initializes the EventInfoViewModel class with the required arguments.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[registerForEvent](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/registerForEvent.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


The function allows user to register for an event.

[reorderAgendaItems](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/reorderAgendaItems.html)([int](https://api.flutter.dev/flutter/dart-core/int-class.html) oldIndex, [int](https://api.flutter.dev/flutter/dart-core/int-class.html) newIndex)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Method to redorder the sequence of agenda items.

[setSelectedCategories](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/setSelectedCategories.html)([List](https://api.flutter.dev/flutter/dart-core/List-class.html) categories)
→ void


method to select multiple categories.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited

[updateAgendaItemSequence](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/updateAgendaItemSequence.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) itemId, [int](https://api.flutter.dev/flutter/dart-core/int-class.html) newSequence)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Method to update the sequence of an agenda item.



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [event\_info\_view\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3. EventInfoViewModel class

##### event\_info\_view\_model library





talawa
1.0.0+1






