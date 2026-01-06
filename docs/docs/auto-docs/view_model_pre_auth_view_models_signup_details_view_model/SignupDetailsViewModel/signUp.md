
<div>

# signUp method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Initiates the sign-up process.

Handles the sign-up process by performing the following steps:

1.  Unfocusing the current focus scope.
2.  Setting the view state to `ViewState.busy`.
3.  Setting validation mode to `AutovalidateMode.always`.
4.  Setting the view state to `ViewState.idle`.
5.  Validating the form using the form key.
6.  If validation is successful, disabling auto-validation mode and
    initiating the sign-up.
7.  Displaying a custom progress dialog during sign-up.
8.  Initializing database functions.
9.  Performing a GraphQL mutation to register the user with provided
    details (first name, last name, email, password).
10. Handling the result of the sign-up operation:
    -   Updating the current user with the received data.
    -   Refreshing the access token.
    -   Joining a public organization or sending a membership request
        based on the selected organization.

In case of any exceptions during the sign-up process, this function
catches and prints the error and displays a Talawa error snackbar with a
corresponding message.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future&lt;void&gt;  async 
```







1.  [talawa](../../index.md)
2.  [signup_details_view_model](../../view_model_pre_auth_view_models_signup_details_view_model/)
3.  [SignupDetailsViewModel](../../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel-class.md)
4.  signUp method

##### SignupDetailsViewModel class







