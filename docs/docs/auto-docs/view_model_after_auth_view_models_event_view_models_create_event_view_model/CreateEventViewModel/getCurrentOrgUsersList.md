
<div>

# getCurrentOrgUsersList method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../../models_user_user_info/User-class.html)]\>]]\>]]




This function fetch all the users in the current organization and return
`List`.

**params**: None

**returns**:

-   `Future<List<User>>`: Current Organization Users List



## Implementation

``` language-dart
Future<List<User>>  async {
  if (orgMembersList.isEmpty) {
    orgMembersList = await organizationService
        .getOrgMembersList(userConfig.currentOrg.id!);
  }

  // loop through list
  orgMembersList.forEach((orgMember) {
    _memberCheckedMap.putIfAbsent(orgMember.id!, () => false);
    _memberCheckedMap.putIfAbsent(orgMember.id!, () => false);
  });
  // return list
  return orgMembersList;
}
```







1.  [talawa](../../index.html)
2.  [create_event_view_model](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4.  getCurrentOrgUsersList method

##### CreateEventViewModel class







