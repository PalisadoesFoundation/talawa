




updateUserJoinedOrg method - UserConfig class - user\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_config.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. [UserConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig-class.html)
4. updateUserJoinedOrg method

updateUserJoinedOrg


dark\_mode

light\_mode




# updateUserJoinedOrg method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
updateUserJoinedOrg(

1. [List](https://api.flutter.dev/flutter/dart-core/List-class.html) orgDetails

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
2. [user\_config](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. [UserConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig-class.html)
4. updateUserJoinedOrg method

##### UserConfig class





talawa
1.0.0+1






