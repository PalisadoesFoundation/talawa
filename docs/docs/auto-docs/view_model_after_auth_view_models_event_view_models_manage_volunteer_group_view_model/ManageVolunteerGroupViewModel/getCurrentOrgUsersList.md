




getCurrentOrgUsersList method - ManageVolunteerGroupViewModel class - manage\_volunteer\_group\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/manage\_volunteer\_group\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model-library.html)
3. [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4. getCurrentOrgUsersList method

getCurrentOrgUsersList


dark\_mode

light\_mode




# getCurrentOrgUsersList method


Future<List<[User](../../models_user_user_info/User-class.html)>>
getCurrentOrgUsersList()

Fetches the list of current organization members.

**params**:
None

**returns**:

* `Future<List<User>>`: A list of organization members.

## Implementation

```
Future<List<User>> getCurrentOrgUsersList() async {
  if (orgMembersList.isEmpty) {
    orgMembersList = await organizationService
        .getOrgMembersList(userConfig.currentOrg.id!);
  }
  final availableMembers = orgMembersList.where((member) {
    return !volunteers.any((volunteer) => volunteer.user!.id == member.id);
  }).toList();

  for (final member in availableMembers) {
    _memberCheckedMap.putIfAbsent(member.id!, () => false);
  }

  return availableMembers;
}
```

 


1. [talawa](../../index.html)
2. [manage\_volunteer\_group\_view\_model](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model-library.html)
3. [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4. getCurrentOrgUsersList method

##### ManageVolunteerGroupViewModel class





talawa
1.0.0+1






