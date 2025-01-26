::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/pre_auth_view_models/select_organization_view_model.dart](../../view_model_pre_auth_view_models_select_organization_view_model/)
3.  [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4.  selectOrg method

::: self-name
selectOrg
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [selectOrg]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[selectOrg]{.name}(

1.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]{.type-annotation}
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
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [select_organization_view_model](../../view_model_pre_auth_view_models_select_organization_view_model/)
3.  [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4.  selectOrg method

##### SelectOrganizationViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
