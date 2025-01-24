




updateUserAdminOrg method - UserConfig class - user\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_config.dart](../../services_user_config/services_user_config-library.html)
3. [UserConfig](../../services_user_config/UserConfig-class.html)
4. updateUserAdminOrg method

updateUserAdminOrg


dark\_mode

light\_mode




# updateUserAdminOrg method


Future<void>
updateUserAdminOrg(

1. List<[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)> orgDetails

)

Updates the organization admin.

**params**:

* `orgDetails`: details of the organization that user joined.

**returns**:
None


## Implementation

```
Future<void> updateUserAdminOrg(List<OrgInfo> orgDetails) async {
  _currentUser!.updateAdminFor(orgDetails);
  saveUserInHive();
}
```

 


1. [talawa](../../index.html)
2. [user\_config](../../services_user_config/services_user_config-library.html)
3. [UserConfig](../../services_user_config/UserConfig-class.html)
4. updateUserAdminOrg method

##### UserConfig class





talawa
1.0.0+1






