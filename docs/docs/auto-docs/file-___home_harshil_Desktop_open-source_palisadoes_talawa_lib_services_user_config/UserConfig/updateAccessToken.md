




updateAccessToken method - UserConfig class - user\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_config.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. [UserConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig-class.html)
4. updateAccessToken method

updateAccessToken


dark\_mode

light\_mode




# updateAccessToken method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
updateAccessToken({

1. required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) accessToken,
2. required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) refreshToken,

})

Updates the access token of the user.

**params**:

* `accessToken`: current user's accesstoken.
* `refreshToken`: current user's refreshtoken.

**returns**:
None


## Implementation

```
Future<void> updateAccessToken({
  required String accessToken,
  required String refreshToken,
}) async {
  _currentUser!.refreshToken = refreshToken;
  _currentUser!.authToken = accessToken;
  saveUserInHive();
}
```

 


1. [talawa](../../index.html)
2. [user\_config](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. [UserConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig-class.html)
4. updateAccessToken method

##### UserConfig class





talawa
1.0.0+1






