
<div>

# saveCurrentOrgInHive method

</div>


void saveCurrentOrgInHive(

1.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.md)]
    saveOrgAsCurrent]

)



save current organization details in hive.

**params**:

-   `saveOrgAsCurrent`: instance of OrgInfo

**returns**: None



## Implementation

``` language-dart
void saveCurrentOrgInHive(OrgInfo saveOrgAsCurrent) {
  _currentOrg = saveOrgAsCurrent;
  _currentOrgInfoController.add(_currentOrg!);
  final box = Hive.box<OrgInfo>('currentOrg');
  if (box.get('org') == null) {
    box.put('org', _currentOrg!);
  } else {
    box.put('org', _currentOrg!);
  }
}
```







1.  [talawa](../../index.md)
2.  [user_config](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.md)
4.  saveCurrentOrgInHive method

##### UserConfig class







