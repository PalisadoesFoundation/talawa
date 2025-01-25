




storingCredentialsInSecureStorage method - SignupDetailsViewModel class - signup\_details\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/signup\_details\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/)
3. [SignupDetailsViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel-class.html)
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
2. [signup\_details\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/)
3. [SignupDetailsViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel-class.html)
4. storingCredentialsInSecureStorage method

##### SignupDetailsViewModel class





talawa
1.0.0+1






