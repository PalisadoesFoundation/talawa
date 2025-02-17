
<div>

# EventInfoViewModel class

</div>


EventInfoViewModel class helps interacting with model to serve view with
the event information data.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   EventInfoViewModel



## Constructors

[EventInfoViewModel](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/EventInfoViewModel.html)

:   



## Properties

[[agendaItems](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/agendaItems.html)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem-class.html)]\>]]
:   List of volunteer groups of an event.
    ::: features
    no setter
    :::

[[attendees](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/attendees.html)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Attendee](../models_events_event_model/Attendee-class.html)]\>]]
:   List of Attendee type to store the attendees data.
    ::: features
    getter/setter pair
    :::

[[categories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/categories.html)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)]\>]]
:   List of Agenda categories in an organisation.
    ::: features
    no setter
    :::

[[event](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/event.html)] [↔ [Event](../models_events_event_model/Event-class.html)]
:   Event instance to store the event data.
    ::: features
    getter/setter pair
    :::

[[exploreEventsInstance](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/exploreEventsInstance.html)] [↔ [ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)]
:   ExploreEventsViewModel instance to fetch the event data.
    ::: features
    getter/setter pair
    :::

[[fabTitle](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fabTitle.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   String type variable to store the FAB title.
    ::: features
    getter/setter pair
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Whether any listeners are currently registered.
    ::: features
    no setterinherited
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[selectedCategories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/selectedCategories.html)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)]\>]]
:   List of selected Agenda categories for an agenda item.
    ::: features
    no setter
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)] [→ [ViewState](../enums_enums/ViewState.html)]

:   ::: features
    no setterinherited
    :::

[[volunteerGroups](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/volunteerGroups.html)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.html)]\>]]
:   List of volunteer groups of an event.
    ::: features
    no setter
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[createAgendaItem](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/createAgendaItem.html)][({[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] title, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] description, ][required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] duration, ][[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]?] attachments, ][[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]?] urls, ][[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]?] categories, ][[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?] sequence]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem-class.html)?]\>]] ]
:   This function is used to create a new agenda item for an event.

[[createVolunteerGroup](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/createVolunteerGroup.html)][([[[Event](../models_events_event_model/Event-class.html)] event, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] groupName, ][[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)] volunteersRequired]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.html)?]\>]] ]
:   This function is used to create a new volunteer group for an event.

[[deleteAgendaItem](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/deleteAgendaItem.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] id]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to delete an agenda item.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

[[fetchAgendaItems](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchAgendaItems.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to fetch all agenda items of an organization.

[[fetchCategories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchCategories.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to fecth all agenda categories of an organisation.

[[fetchVolunteerGroups](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchVolunteerGroups.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] eventId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Fetches all volunteer groups for the current event.

[[getFabTitle](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/getFabTitle.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   The funtion returns title to be displayed on Floating Action Button.

[[initialize](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/initialize.html)][({[required [[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] args]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function initializes the EventInfoViewModel class with the
    required arguments.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html) [→ void ]
:   Call all the registered listeners.
    ::: features
    inherited
    :::

[[registerForEvent](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/registerForEvent.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   The function allows user to register for an event.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[reorderAgendaItems](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/reorderAgendaItems.html)][([[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)] oldIndex, ][[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)] newIndex]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to redorder the sequence of agenda items.

[[setSelectedCategories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/setSelectedCategories.html)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.html)]\>]] categories]) → void ]
:   method to select multiple categories.

[[setState](../view_model_base_view_model/BaseModel/setState.html)][([[[ViewState](../enums_enums/ViewState.html)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updateAgendaItemSequence](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/updateAgendaItemSequence.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] itemId, ][[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)] newSequence]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to update the sequence of an agenda item.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [event_info_view_model](../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  EventInfoViewModel class

##### event_info_view_model library







