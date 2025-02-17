
<div>

# getCurrentOrgUsersList method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../../models_user_user_info/User-class.md)]\>]]\>]]




Fetches the list of current organization members.

**params**: None

**returns**:

-   `Future<List<User>>`: A list of organization members.



## Implementation

``` language-dart
Future<List<User>>  async {
  if (orgMembersList.isEmpty) {
    orgMembersList = await organizationService
        .getOrgMembersList(userConfig.currentOrg.id!);
  }
  final availableMembers = orgMembersList.where((member) {
    return !volunteers.any((volunteer) => volunteer.user!.id == member.id);
  }).;

  for (final member in availableMembers) {
    _memberCheckedMap.putIfAbsent(member.id!, () => false);
  }

  return availableMembers;
}
```







1.  [talawa](../../index.md)
2.  [manage_volunteer_group_view_model](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3.  [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.md)
4.  getCurrentOrgUsersList method

##### ManageVolunteerGroupViewModel class







