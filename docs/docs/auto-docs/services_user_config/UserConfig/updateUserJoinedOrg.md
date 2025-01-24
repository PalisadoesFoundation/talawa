




updateUserJoinedOrg method - UserConfig class - user\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_config.dart](../../services_user_config/services_user_config-library.html)
3. [UserConfig](../../services_user_config/UserConfig-class.html)
4. updateUserJoinedOrg method

updateUserJoinedOrg


dark\_mode

light\_mode




# updateUserJoinedOrg method


Future<void>
updateUserJoinedOrg(

1. List<[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)> orgDetails

)

Updates the user joined organization.

**params**:

* `orgDetails`: details of the organization that user joined.

**returns**:
None


## Implementation

```
Future<void> updateUserJoinedOrg(List<OrgInfo> orgDetails) async {
  _currentUser!.updateJoinedOrg(orgDetails);
  saveUserInHive();
}
```

 


1. [talawa](../../index.html)
2. [user\_config](../../services_user_config/services_user_config-library.html)
3. [UserConfig](../../services_user_config/UserConfig-class.html)
4. updateUserJoinedOrg method

##### UserConfig class





talawa
1.0.0+1






