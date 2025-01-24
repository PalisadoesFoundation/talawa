




fetchPrevUser method - LoginViewModel class - login\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/login\_view\_model.dart](../../view_model_pre_auth_view_models_login_view_model/view_model_pre_auth_view_models_login_view_model-library.html)
3. [LoginViewModel](../../view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4. fetchPrevUser method

fetchPrevUser


dark\_mode

light\_mode




# fetchPrevUser method


Future<void>
fetchPrevUser()

Fetch the previous user credentials.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> fetchPrevUser() async {
  try {
    prevUserEmail = await secureStorage.read(key: "userEmail");
    prevUserPassword = await secureStorage.read(key: "userPassword");
  } catch (e) {
    print("Error decrypting previous values $e");
  }
}
```

 


1. [talawa](../../index.html)
2. [login\_view\_model](../../view_model_pre_auth_view_models_login_view_model/view_model_pre_auth_view_models_login_view_model-library.html)
3. [LoginViewModel](../../view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4. fetchPrevUser method

##### LoginViewModel class





talawa
1.0.0+1






