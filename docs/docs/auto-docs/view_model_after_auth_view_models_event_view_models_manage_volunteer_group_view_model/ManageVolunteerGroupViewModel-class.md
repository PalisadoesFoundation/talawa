




ManageVolunteerGroupViewModel class - manage\_volunteer\_group\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/manage\_volunteer\_group\_view\_model.dart](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model-library.html)
3. ManageVolunteerGroupViewModel class

ManageVolunteerGroupViewModel


dark\_mode

light\_mode




# ManageVolunteerGroupViewModel class


A ViewModel for managing volunteer groups within an event.

This class handles operations related to volunteer groups including
initializing the group, adding/removing volunteers, and updating group details.


Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* ManageVolunteerGroupViewModel



## Constructors

[ManageVolunteerGroupViewModel](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/ManageVolunteerGroupViewModel.html)()




## Properties

[event](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/event.html)
↔ [Event](../models_events_event_model/Event-class.html)

The event associated with the volunteer group.
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

[isFetchingVolunteers](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/isFetchingVolunteers.html)
→ bool

Gets whether the view model is currently fetching volunteers.
no setter

[memberCheckedMap](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/memberCheckedMap.html)
→ Map<String, bool>

Gets the map of member IDs and their selection state.
no setter

[orgMembersList](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/orgMembersList.html)
↔ List<[User](../models_user_user_info/User-class.html)>

List of organization members.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited

[volunteers](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/volunteers.html)
→ List<[EventVolunteer](../models_events_event_volunteer/EventVolunteer-class.html)>

Gets the list of volunteers in the group.
no setter



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[addVolunteerToGroup](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/addVolunteerToGroup.html)(String volunteerId, String eventId, String groupId)
→ Future<void>


Adds a volunteer to the specified group.

[deleteVolunteerGroup](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/deleteVolunteerGroup.html)(String groupId)
→ Future<void>


Deletes a volunteer group.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
inherited

[getCurrentOrgUsersList](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/getCurrentOrgUsersList.html)()
→ Future<List<[User](../models_user_user_info/User-class.html)>>


Fetches the list of current organization members.

[initialize](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/initialize.html)([Event](../models_events_event_model/Event-class.html) parentEvent, [EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.html) group)
→ Future<void>


Initializes the view model with the given event and volunteer group.

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[removeVolunteerFromGroup](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/removeVolunteerFromGroup.html)(String volunteerId)
→ Future<void>


Removes a volunteer from the group.

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited

[updateVolunteerGroup](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/updateVolunteerGroup.html)([EventVolunteerGroup](../models_events_event_volunteer_group/EventVolunteerGroup-class.html) group, String eventId, String name, int volunteersRequired)
→ Future<void>


Updates the details of a volunteer group.



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [manage\_volunteer\_group\_view\_model](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model-library.html)
3. ManageVolunteerGroupViewModel class

##### manage\_volunteer\_group\_view\_model library





talawa
1.0.0+1






