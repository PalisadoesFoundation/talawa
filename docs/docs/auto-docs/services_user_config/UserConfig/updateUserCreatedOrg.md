




updateUserCreatedOrg method - UserConfig class - user\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_config.dart](../../services_user_config/services_user_config-library.html)
3. [UserConfig](../../services_user_config/UserConfig-class.html)
4. updateUserCreatedOrg method

updateUserCreatedOrg


dark\_mode

light\_mode




# updateUserCreatedOrg method


Future<void>
updateUserCreatedOrg(

1. List<[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)> orgDetails

)

Updates the user created organization.

**params**:

* `orgDetails`: details of the organization that user joined.

**returns**:
None


## Implementation

```
Future<void> updateUserCreatedOrg(List<OrgInfo> orgDetails) async {
  _currentUser!.updateCreatedOrg(orgDetails);
  saveUserInHive();
}
```

 


1. [talawa](../../index.html)
2. [user\_config](../../services_user_config/services_user_config-library.html)
3. [UserConfig](../../services_user_config/UserConfig-class.html)
4. updateUserCreatedOrg method

##### UserConfig class





talawa
1.0.0+1






