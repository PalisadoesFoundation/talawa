::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [selectOrg]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[selectOrg]{.name}(

1.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)?]{.type-annotation}
    [item]{.parameter-name}]{#selectOrg-param-item .parameter}

)
:::

::: {.section .desc .markdown}
This function select the organization.

**params**:

-   `item`: Selected organization data.

**returns**:

-   `Future<void>`: None
:::

::: {#source .section .summary .source-code}
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
      notifyListeners();
      onTapJoin();

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
    notifyListeners();
    navigationService.pushScreen(
      Routes.signupDetailScreen,
      arguments: selectedOrganization,
    );
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [select_organization_view_model](../../view_model_pre_auth_view_models_select_organization_view_model/)
3.  [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4.  selectOrg method

##### SelectOrganizationViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
