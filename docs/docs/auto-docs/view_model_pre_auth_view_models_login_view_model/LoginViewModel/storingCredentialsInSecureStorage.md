




storingCredentialsInSecureStorage method - LoginViewModel class - login\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/login\_view\_model.dart](../../view_model_pre_auth_view_models_login_view_model/view_model_pre_auth_view_models_login_view_model-library.html)
3. [LoginViewModel](../../view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4. storingCredentialsInSecureStorage method

storingCredentialsInSecureStorage


dark\_mode

light\_mode




# storingCredentialsInSecureStorage method


Future<void>
storingCredentialsInSecureStorage()

Storing credentials in secure storage.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> storingCredentialsInSecureStorage() async {
  try {
    await secureStorage.write(
      key: "userEmail",
      value: this.email.text,
    );
    await secureStorage.write(
      key: "userPassword",
      value: this.password.text,
    );
  } catch (e) {
    // Handle secure storage write failure
    print("Failed to save credentials: $e");
  }
}
```

 


1. [talawa](../../index.html)
2. [login\_view\_model](../../view_model_pre_auth_view_models_login_view_model/view_model_pre_auth_view_models_login_view_model-library.html)
3. [LoginViewModel](../../view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4. storingCredentialsInSecureStorage method

##### LoginViewModel class





talawa
1.0.0+1






