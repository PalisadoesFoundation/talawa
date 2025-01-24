




getCurrentOrgUsersList method - SelectContactViewModel class - select\_contact\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/chat\_view\_models/select\_contact\_view\_model.dart](../../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/view_model_after_auth_view_models_chat_view_models_select_contact_view_model-library.html)
3. [SelectContactViewModel](../../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel-class.html)
4. getCurrentOrgUsersList method

getCurrentOrgUsersList


dark\_mode

light\_mode




# getCurrentOrgUsersList method


Future<void>
getCurrentOrgUsersList()

function to get all users of current organization.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> getCurrentOrgUsersList() async {
  if (orgMembersList.isEmpty) {
    orgMembersList = await _organizationService
        .getOrgMembersList(userConfig.currentOrg.id!);
    notifyListeners();
  }
}
```

 


1. [talawa](../../index.html)
2. [select\_contact\_view\_model](../../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/view_model_after_auth_view_models_chat_view_models_select_contact_view_model-library.html)
3. [SelectContactViewModel](../../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel-class.html)
4. getCurrentOrgUsersList method

##### SelectContactViewModel class





talawa
1.0.0+1






