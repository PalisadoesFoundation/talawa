




selectOrg method - SelectOrganizationViewModel class - select\_organization\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/select\_organization\_view\_model.dart](../../view_model_pre_auth_view_models_select_organization_view_model/view_model_pre_auth_view_models_select_organization_view_model-library.html)
3. [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4. selectOrg method

selectOrg


dark\_mode

light\_mode




# selectOrg method


Future<void>
selectOrg(

1. [OrgInfo](../../models_organization_org_info/OrgInfo-class.html) item

)

This function select the organization.

**params**:

* `item`: Selected organization data.

**returns**:

* `Future<void>`: None

## Implementation

```
Future<void> selectOrg(OrgInfo item) async {
  bool orgAlreadyJoined = false;
  bool orgRequestAlreadyPresent = false;
  // if user session not expirec
  if (userConfig.loggedIn) {
    // check if user has already joined the selected organization.
    userConfig.currentUser.joinedOrganizations!.forEach((element) {
      if (element.id! == item.id) {
        orgAlreadyJoined = true;
      }
    });
    // check if user has already send the membership request to the selected organization.
    userConfig.currentUser.membershipRequests!.forEach((element) {
      if (element.id! == item.id) {
        orgRequestAlreadyPresent = true;
      }
    });
    // if not already joined and not memebrship request.
    if (!orgAlreadyJoined && !orgRequestAlreadyPresent) {
      selectedOrganization = item;
      notifyListeners();
      onTapJoin();

      if (selectedOrganization.userRegistrationRequired!) {
        navigationService.pushScreen(
          Routes.requestAccess,
          arguments: selectedOrganization,
        );
      }
    } else if (orgAlreadyJoined) {
      selectedOrganization = OrgInfo(id: '-1');
      navigationService.showTalawaErrorSnackBar(
        'Organisation already joined',
        MessageType.warning,
      );
    } else {
      navigationService.showTalawaErrorSnackBar(
        'Membership request already sent',
        MessageType.warning,
      );
    }
  } else {
    selectedOrganization = item;
    notifyListeners();
    navigationService.pushScreen(
      Routes.signupDetailScreen,
      arguments: selectedOrganization,
    );
  }
}
```

 


1. [talawa](../../index.html)
2. [select\_organization\_view\_model](../../view_model_pre_auth_view_models_select_organization_view_model/view_model_pre_auth_view_models_select_organization_view_model-library.html)
3. [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4. selectOrg method

##### SelectOrganizationViewModel class





talawa
1.0.0+1






