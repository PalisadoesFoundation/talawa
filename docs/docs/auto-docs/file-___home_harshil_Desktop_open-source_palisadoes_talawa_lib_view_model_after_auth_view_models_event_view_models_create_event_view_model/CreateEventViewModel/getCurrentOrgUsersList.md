




getCurrentOrgUsersList method - CreateEventViewModel class - create\_event\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/create\_event\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3. [CreateEventViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4. getCurrentOrgUsersList method

getCurrentOrgUsersList


dark\_mode

light\_mode




# getCurrentOrgUsersList method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>
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
2. [create\_event\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3. [CreateEventViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4. getCurrentOrgUsersList method

##### CreateEventViewModel class





talawa
1.0.0+1






