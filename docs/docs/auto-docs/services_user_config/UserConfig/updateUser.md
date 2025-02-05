


# updateUser method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)> updateUser
([User](../../models_user_user_info/User-class.md) updatedUserDetails)





<p>This function is used to update the user details.</p>
<p>params:</p>
<ul>
<li><code>updatedUserDetails</code> : <code>User</code> type variable containing all the details of an user need to be updated.</li>
</ul>



## Implementation

```dart
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







