
<div>

# EventInfoViewModel class

</div>


EventInfoViewModel class helps interacting with model to serve view with
the event information data.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   EventInfoViewModel



## Constructors

[EventInfoViewModel](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/EventInfoViewModel.md)

:   



## Properties

[[agendaItems](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/agendaItems.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem-class.md)]\>]]
:   List of volunteer groups of an event.
    ::: features
    no setter
    :::

[[attendees](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/attendees.md)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Attendee](../models_events_event_model/Attendee-class.md)]\>]]
:   List of Attendee type to store the attendees data.
    ::: features
    getter/setter pair
    :::

[[categories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/categories.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.md)]\>]]
:   List of Agenda categories in an organisation.
    ::: features
    no setter
    :::

[[event](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/event.md)] [↔ [Event](../models_events_event_model/Event-class.md)]
:   Event instance to store the event data.
    ::: features
    getter/setter pair
    :::

[[exploreEventsInstance](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/exploreEventsInstance.md)] [↔ [ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.md)]
:   ExploreEventsViewModel instance to fetch the event data.
    ::: features
    getter/setter pair
    :::

[[fabTitle](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fabTitle.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
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

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[selectedCategories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/selectedCategories.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.md)]\>]]
:   List of selected Agenda categories for an agenda item.
    ::: features
    no setter
    :::

[[state](../view_model_base_view_model/BaseModel/state.md)] [→ [ViewState](../enums_enums/ViewState.md)]

:   ::: features
    no setterinherited
    :::

[[volunteerGroups](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/volunteerGroups.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.md)]\>]]
:   List of volunteer groups of an event.
    ::: features
    no setter
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[createAgendaItem](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/createAgendaItem.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[EventAgendaItem](../models_events_event_agenda_item/EventAgendaItem-class.md)?]\>]] ]
:   This function is used to create a new agenda item for an event.

[[createVolunteerGroup](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/createVolunteerGroup.md)][([[[Event](../models_events_event_model/Event-class.md)] event, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] groupName, ][[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)] volunteersRequired]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.md)?]\>]] ]
:   This function is used to create a new volunteer group for an event.

[[deleteAgendaItem](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/deleteAgendaItem.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] id]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to delete an agenda item.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

[[fetchAgendaItems](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchAgendaItems.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to fetch all agenda items of an organization.

[[fetchCategories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchCategories.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to fecth all agenda categories of an organisation.

[[fetchVolunteerGroups](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/fetchVolunteerGroups.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] eventId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Fetches all volunteer groups for the current event.

[[getFabTitle](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/getFabTitle.md)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   The funtion returns title to be displayed on Floating Action Button.

[[initialize](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/initialize.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function initializes the EventInfoViewModel class with the
    required arguments.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html) [→ void ]
:   Call all the registered listeners.
    ::: features
    inherited
    :::

[[registerForEvent](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/registerForEvent.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   The function allows user to register for an event.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[reorderAgendaItems](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/reorderAgendaItems.md)][([[[int](https://api.flutter.dev/flutter/dart-core/int-class.md)] oldIndex, ][[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)] newIndex]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to redorder the sequence of agenda items.

[[setSelectedCategories](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/setSelectedCategories.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[AgendaCategory](../models_events_event_agenda_category/AgendaCategory-class.md)]\>]] categories]) → void ]
:   method to select multiple categories.

[[setState](../view_model_base_view_model/BaseModel/setState.md)][([[[ViewState](../enums_enums/ViewState.md)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updateAgendaItemSequence](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel/updateAgendaItemSequence.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] itemId, ][[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)] newSequence]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to update the sequence of an agenda item.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [event_info_view_model](../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  EventInfoViewModel class

##### event_info_view_model library







