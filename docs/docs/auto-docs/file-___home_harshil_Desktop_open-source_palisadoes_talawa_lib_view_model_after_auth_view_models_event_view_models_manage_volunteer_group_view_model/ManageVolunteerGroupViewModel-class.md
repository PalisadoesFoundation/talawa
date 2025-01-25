




ManageVolunteerGroupViewModel class - manage\_volunteer\_group\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/manage\_volunteer\_group\_view\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3. ManageVolunteerGroupViewModel class

ManageVolunteerGroupViewModel


dark\_mode

light\_mode




# ManageVolunteerGroupViewModel class


A ViewModel for managing volunteer groups within an event.

This class handles operations related to volunteer groups including
initializing the group, adding/removing volunteers, and updating group details.


## Constructors

[ManageVolunteerGroupViewModel](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/ManageVolunteerGroupViewModel.html)()




## Properties

[event](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/event.html)
↔ dynamic

The event associated with the volunteer group.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[isFetchingVolunteers](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/isFetchingVolunteers.html)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)

Gets whether the view model is currently fetching volunteers.
no setter

[memberCheckedMap](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/memberCheckedMap.html)
→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>

Gets the map of member IDs and their selection state.
no setter

[orgMembersList](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/orgMembersList.html)
↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

List of organization members.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited

[volunteers](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/volunteers.html)
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

Gets the list of volunteers in the group.
no setter



## Methods

[addVolunteerToGroup](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/addVolunteerToGroup.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) volunteerId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) groupId)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Adds a volunteer to the specified group.

[deleteVolunteerGroup](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/deleteVolunteerGroup.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) groupId)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Deletes a volunteer group.

[getCurrentOrgUsersList](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/getCurrentOrgUsersList.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>


Fetches the list of current organization members.

[initialize](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/initialize.html)(dynamic parentEvent, dynamic group)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Initializes the view model with the given event and volunteer group.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[removeVolunteerFromGroup](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/removeVolunteerFromGroup.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) volunteerId)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Removes a volunteer from the group.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited

[updateVolunteerGroup](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel/updateVolunteerGroup.html)(dynamic group, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) name, [int](https://api.flutter.dev/flutter/dart-core/int-class.html) volunteersRequired)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Updates the details of a volunteer group.



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [manage\_volunteer\_group\_view\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3. ManageVolunteerGroupViewModel class

##### manage\_volunteer\_group\_view\_model library





talawa
1.0.0+1






