




saveCurrentOrgInHive method - UserConfig class - user\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_config.dart](../../services_user_config/services_user_config-library.html)
3. [UserConfig](../../services_user_config/UserConfig-class.html)
4. saveCurrentOrgInHive method

saveCurrentOrgInHive


dark\_mode

light\_mode




# saveCurrentOrgInHive method


void
saveCurrentOrgInHive(

1. [OrgInfo](../../models_organization_org_info/OrgInfo-class.html) saveOrgAsCurrent

)

save current organization details in hive.

**params**:

* `saveOrgAsCurrent`: instance of OrgInfo

**returns**:
None


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [user\_config](../../services_user_config/services_user_config-library.html)
3. [UserConfig](../../services_user_config/UserConfig-class.html)
4. saveCurrentOrgInHive method

##### UserConfig class





talawa
1.0.0+1






