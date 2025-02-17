
<div>

# ManageVolunteerGroupViewModel class

</div>


A ViewModel for managing volunteer groups within an event.

This class handles operations related to volunteer groups including
initializing the group, adding/removing volunteers, and updating group
details.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   ManageVolunteerGroupViewModel



## Constructors

[ManageVolunteerGroupViewModel](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/ManageVolunteerGroupViewModel.html)

:   



## Properties

[[event](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/event.html)] [↔ [Event](../models_events_event_model/Event-class.html)]
:   The event associated with the volunteer group.
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

[[isFetchingVolunteers](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/isFetchingVolunteers.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Gets whether the view model is currently fetching volunteers.
    ::: features
    no setter
    :::

[[memberCheckedMap](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/memberCheckedMap.html)] [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], [[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]
:   Gets the map of member IDs and their selection state.
    ::: features
    no setter
    :::

[[orgMembersList](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/orgMembersList.html)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.html)]\>]]
:   List of organization members.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)] [→ [ViewState](../enums_enums/ViewState.html)]

:   ::: features
    no setterinherited
    :::

[[volunteers](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/volunteers.html)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[EventVolunteer](../models_events_event_volunteer/EventVolunteer-class.html)]\>]]
:   Gets the list of volunteers in the group.
    ::: features
    no setter
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[addVolunteerToGroup](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/addVolunteerToGroup.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] volunteerId, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] eventId, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] groupId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Adds a volunteer to the specified group.

[[deleteVolunteerGroup](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/deleteVolunteerGroup.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] groupId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Deletes a volunteer group.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

[[getCurrentOrgUsersList](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/getCurrentOrgUsersList.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.html)]\>]]\>]] ]
:   Fetches the list of current organization members.

[[initialize](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/initialize.html)][([[[Event](../models_events_event_model/Event-class.html)] parentEvent, ][[[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.html)] group]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Initializes the view model with the given event and volunteer group.

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

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[removeVolunteerFromGroup](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/removeVolunteerFromGroup.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] volunteerId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Removes a volunteer from the group.

[[setState](../view_model_base_view_model/BaseModel/setState.html)][([[[ViewState](../enums_enums/ViewState.html)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updateVolunteerGroup](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/updateVolunteerGroup.html)][([[[EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.html)] group, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] eventId, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] name, ][[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)] volunteersRequired]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Updates the details of a volunteer group.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [manage_volunteer_group_view_model](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3.  ManageVolunteerGroupViewModel class

##### manage_volunteer_group_view_model library







