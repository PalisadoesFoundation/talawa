




updateUser method - UserConfig class - user\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_config.dart](../../services_user_config/services_user_config-library.html)
3. [UserConfig](../../services_user_config/UserConfig-class.html)
4. updateUser method

updateUser


dark\_mode

light\_mode




# updateUser method


Future<bool>
updateUser(

1. [User](../../models_user_user_info/User-class.html) updatedUserDetails

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
2. [user\_config](../../services_user_config/services_user_config-library.html)
3. [UserConfig](../../services_user_config/UserConfig-class.html)
4. updateUser method

##### UserConfig class





talawa
1.0.0+1






