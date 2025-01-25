




storingCredentialsInSecureStorage method - LoginViewModel class - login\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/login\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/)
3. [LoginViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4. storingCredentialsInSecureStorage method

storingCredentialsInSecureStorage


dark\_mode

light\_mode




# storingCredentialsInSecureStorage method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
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
2. [login\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/)
3. [LoginViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4. storingCredentialsInSecureStorage method

##### LoginViewModel class





talawa
1.0.0+1






