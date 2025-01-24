




getCurrentOrgUsersList method - CreateEventViewModel class - create\_event\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/create\_event\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/view_model_after_auth_view_models_event_view_models_create_event_view_model-library.html)
3. [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4. getCurrentOrgUsersList method

getCurrentOrgUsersList


dark\_mode

light\_mode




# getCurrentOrgUsersList method


Future<List<[User](../../models_user_user_info/User-class.html)>>
getCurrentOrgUsersList()

This function fetch all the users in the current organization and return `List`.

**params**:
None

**returns**:

* `Future<List<User>>`: Current Organization Users List

## Implementation

```
Future<List<User>> getCurrentOrgUsersList() async {
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

 


1. [talawa](../../index.html)
2. [create\_event\_view\_model](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/view_model_after_auth_view_models_event_view_models_create_event_view_model-library.html)
3. [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4. getCurrentOrgUsersList method

##### CreateEventViewModel class





talawa
1.0.0+1






