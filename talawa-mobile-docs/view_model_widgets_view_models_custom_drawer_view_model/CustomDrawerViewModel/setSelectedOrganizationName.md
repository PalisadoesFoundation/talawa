


# setSelectedOrganizationName method








void setSelectedOrganizationName
([OrgInfo](../../models_organization_org_info/OrgInfo-class.md) updatedOrganization)





<p>This function switches the current organization to new organization.</p>
<p>params:</p>
<ul>
<li><code>updatedOrganization</code> : <code>OrgInfo</code> type, new organization.</li>
</ul>



## Implementation

```dart
void setSelectedOrganizationName(OrgInfo updatedOrganization) {
  // if current and updated organization are not same.
  if (_selectedOrg != updatedOrganization) {
    _selectedOrg = updatedOrganization;
    // update in `UserConfig` variable.
    userConfig.currentOrgInfoController.add(_selectedOrg!);
    notifyListeners();
  }
}
```







