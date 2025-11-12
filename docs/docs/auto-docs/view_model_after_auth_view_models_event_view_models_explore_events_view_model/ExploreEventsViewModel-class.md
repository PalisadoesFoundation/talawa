



menu

1.  [talawa](../index.md)
2.  [view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/)
3.  ExploreEventsViewModel class


ExploreEventsViewModel


 dark_mode   light_mode 




<div>

# ExploreEventsViewModel class

</div>


ExploreEventsViewModel class helps to interact with model to serve data
to view for event explore section.

Methods include:

-   `fetchNewEvents` : to fetch new events in the organization.
-   `refreshEvents` : to refersh the event.
-   `checkIfExistsAndAddNewEvent` : to check if the event exists or not,
    if now add a new event.
-   `deleteEvent` : to delete the event.
-   `choseValueFromDropdown` : to return the relevant message in the
    dropdown after any action.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   ExploreEventsViewModel



## Constructors

[[ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/ExploreEventsViewModel.md)][]

:   



## Properties

[[chosenValue](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/chosenValue.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   Getter method to retrieve the chosen value.
    ::: features
    no setter
    :::

[[demoMode](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/demoMode.md)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   flag to check if the app is in demo mode.
    ::: features
    getter/setter pair
    :::

[[emptyListMessage](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/emptyListMessage.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   Getter method to retrieve the empty list message.
    ::: features
    no setter
    :::

[[events](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/events.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.md)]\>]]
:   Getter method to retrieve the list of events.
    ::: features
    no setter
    :::

[[eventService](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/eventService.md)] [→ [EventService](../services_event_service/EventService-class.md)]
:   Getter method to retrieve the EventService instance.
    ::: features
    no setter
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

[[state](../view_model_base_view_model/BaseModel/state.md)] [→ [ViewState](../enums_enums/ViewState.md)]

:   ::: features
    no setterinherited
    :::

[[userEvents](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/userEvents.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.md)]\>]]
:   Getter method to retrieve the list of User events.
    ::: features
    no setter
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[checkIfExistsAndAddNewEvents](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/checkIfExistsAndAddNewEvents.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[Event](../models_events_event_model/Event-class.md)]\>]] newEvents]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function add a new event if the event not exist.

[[choseValueFromDropdown](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/choseValueFromDropdown.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] value]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function takes the choosen value from dropdown and return the
    filter events, if empty list then return relevant message.

[[deleteEvent](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/deleteEvent.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function deletes the event.

[dispose](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/dispose.md) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
    will throw after the object is disposed).
    ::: features
    override
    :::

[[fetchNewEvents](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/fetchNewEvents.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function is used to fetch new events in the organization.

[[initialise](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/initialise.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   initialiser.

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

[[refreshEvents](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/refreshEvents.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function is used to refresh the events in the organization.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[setState](../view_model_base_view_model/BaseModel/setState.md)][([[[ViewState](../enums_enums/ViewState.md)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [explore_events_view_model](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/)
3.  ExploreEventsViewModel class

##### explore_events_view_model library









 talawa 1.0.0+1 
