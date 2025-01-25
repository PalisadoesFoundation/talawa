




getCurrentOrgUsersList method - ManageVolunteerGroupViewModel class - manage\_volunteer\_group\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/manage\_volunteer\_group\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3. [ManageVolunteerGroupViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4. getCurrentOrgUsersList method

getCurrentOrgUsersList


dark\_mode

light\_mode




# getCurrentOrgUsersList method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>
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
2. [manage\_volunteer\_group\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3. [ManageVolunteerGroupViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4. getCurrentOrgUsersList method

##### ManageVolunteerGroupViewModel class





talawa
1.0.0+1






