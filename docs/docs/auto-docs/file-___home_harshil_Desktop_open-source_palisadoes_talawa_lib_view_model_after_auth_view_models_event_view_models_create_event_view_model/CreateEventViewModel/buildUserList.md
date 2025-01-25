




buildUserList method - CreateEventViewModel class - create\_event\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/create\_event\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3. [CreateEventViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4. buildUserList method

buildUserList


dark\_mode

light\_mode




# buildUserList method


void
buildUserList()

This function build the user list.

**params**:
None

**returns**:
None


## Implementation

```
void buildUserList() {
  _selectedMembers.clear();

  // loop through the organization member list

  orgMembersList.forEach((orgMember) {
    if (_memberCheckedMap[orgMember.id] == true) {
      _selectedMembers.add(orgMember);
    }
  });
  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [create\_event\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3. [CreateEventViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4. buildUserList method

##### CreateEventViewModel class





talawa
1.0.0+1






