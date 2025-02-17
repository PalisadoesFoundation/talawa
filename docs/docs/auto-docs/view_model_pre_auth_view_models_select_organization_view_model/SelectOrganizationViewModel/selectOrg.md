
<div>

# selectOrg method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
selectOrg(

1.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.md)?]
    item]

)



This function select the organization.

**params**:

-   `item`: Selected organization data.

**returns**:

-   `Future<void>`: None



## Implementation

``` language-dart
Future<void> selectOrg(OrgInfo? item) async {
  bool orgAlreadyJoined = false;
  bool orgRequestAlreadyPresent = false;
  // if user session not expirec
  if (userConfig.loggedIn) {
    // check if user has already joined the selected organization.
    userConfig.currentUser.joinedOrganizations!.forEach((element) {
      if (item != null && element.id! == item.id) {
        orgAlreadyJoined = true;
      }
    });
    // check if user has already send the membership request to the selected organization.
    userConfig.currentUser.membershipRequests!.forEach((element) {
      if (item != null && element.id! == item.id) {
        orgRequestAlreadyPresent = true;
      }
    });
    // if not already joined and not memebrship request.
    if (!orgAlreadyJoined && !orgRequestAlreadyPresent) {
      selectedOrganization = item;
      ;
      ;

      if (selectedOrganization!.userRegistrationRequired == true) {
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
    ;
    navigationService.pushScreen(
      Routes.signupDetailScreen,
      arguments: selectedOrganization,
    );
  }
}
```







1.  [talawa](../../index.md)
2.  [select_organization_view_model](../../view_model_pre_auth_view_models_select_organization_view_model/)
3.  [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.md)
4.  selectOrg method

##### SelectOrganizationViewModel class







