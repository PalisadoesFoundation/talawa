
<div>

# storingCredentialsInSecureStorage method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Storing credentials in secure storage.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
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







1.  [talawa](../../index.html)
2.  [signup_details_view_model](../../view_model_pre_auth_view_models_signup_details_view_model/)
3.  [SignupDetailsViewModel](../../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel-class.html)
4.  storingCredentialsInSecureStorage method

##### SignupDetailsViewModel class







