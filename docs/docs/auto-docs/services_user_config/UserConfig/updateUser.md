
<div>

# updateUser method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]
updateUser(

1.  [[[User](../../models_user_user_info/User-class.html)]
    updatedUserDetails]

)



Updates the user details.

**params**:

-   `updatedUserDetails`: `User` type variable containing all the
    details of an user need to be updated.

**returns**:

-   `Future<bool>`: returns future of bool type.



## Implementation

``` language-dart
Future<bool> updateUser(User updatedUserDetails) async {
  try {
    _currentUser = updatedUserDetails;
    ;
    graphqlConfig.;
    databaseFunctions.;
    return true;
  } on Exception catch (e) {
    debugPrint(e.);
    return false;
  }
}
```







1.  [talawa](../../index.html)
2.  [user_config](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.html)
4.  updateUser method

##### UserConfig class







