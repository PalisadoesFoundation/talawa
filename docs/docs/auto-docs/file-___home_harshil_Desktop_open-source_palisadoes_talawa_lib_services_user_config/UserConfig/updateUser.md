




updateUser method - UserConfig class - user\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_config.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. [UserConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig-class.html)
4. updateUser method

updateUser


dark\_mode

light\_mode




# updateUser method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>
updateUser(

1. dynamic updatedUserDetails

)

Updates the user details.

**params**:

* `updatedUserDetails`: `User` type variable containing
  all the details of an user need to be updated.

**returns**:

* `Future<bool>`: returns future of bool type.

## Implementation

```
Future<bool> updateUser(User updatedUserDetails) async {
  try {
    _currentUser = updatedUserDetails;
    saveUserInHive();
    graphqlConfig.getToken();
    databaseFunctions.init();
    return true;
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}
```

 


1. [talawa](../../index.html)
2. [user\_config](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. [UserConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig-class.html)
4. updateUser method

##### UserConfig class





talawa
1.0.0+1






