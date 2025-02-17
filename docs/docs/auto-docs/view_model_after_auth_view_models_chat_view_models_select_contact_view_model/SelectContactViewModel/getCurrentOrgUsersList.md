
<div>

# getCurrentOrgUsersList method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




function to get all users of current organization.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  if (orgMembersList.isEmpty) {
    orgMembersList = await _organizationService
        .getOrgMembersList(userConfig.currentOrg.id!);
    ;
  }
}
```







1.  [talawa](../../index.md)
2.  [select_contact_view_model](../../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/)
3.  [SelectContactViewModel](../../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel-class.md)
4.  getCurrentOrgUsersList method

##### SelectContactViewModel class







