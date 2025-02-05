


# switchOrg method








void switchOrg
([OrgInfo](../../models_organization_org_info/OrgInfo-class.md) switchToOrg)





<p>This function switch the current organization to another organization,
if the organization(want switch to) is present.</p>



## Implementation

```dart
void switchOrg(OrgInfo switchToOrg) {
  // if `selectedOrg` is equal to `switchOrg` and `switchToOrg` present or not.
  if (selectedOrg == switchToOrg && isPresentinSwitchableOrg(switchToOrg)) {
    // _navigationService.pop();
    navigationService.showTalawaErrorSnackBar(
      '${switchToOrg.name} already selected',
      MessageType.warning,
    );
  } else {
    userConfig.saveCurrentOrgInHive(switchToOrg);
    setSelectedOrganizationName(switchToOrg);
    navigationService.showTalawaErrorSnackBar(
      'Switched to ${switchToOrg.name}',
      MessageType.info,
    );
  }
  navigationService.pop();
}
```







