




updateUserCreatedOrg method - UserConfig class - user\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_config.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. [UserConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig-class.html)
4. updateUserCreatedOrg method

updateUserCreatedOrg


dark\_mode

light\_mode




# updateUserCreatedOrg method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
updateUserCreatedOrg(

1. [List](https://api.flutter.dev/flutter/dart-core/List-class.html) orgDetails

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
2. [user\_config](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. [UserConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig-class.html)
4. updateUserCreatedOrg method

##### UserConfig class





talawa
1.0.0+1






