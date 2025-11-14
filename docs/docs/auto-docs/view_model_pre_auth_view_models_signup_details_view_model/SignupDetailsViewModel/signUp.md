<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [signup_details_view_model](../../view_model_pre_auth_view_models_signup_details_view_model/view_model_pre_auth_view_models_signup_details_view_model-library.md)
3.  [SignupDetailsViewModel](../../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel-class.md)
4.  signUp method

<div class="self-name">

signUp

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">signUp</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span>
<span class="name">signUp</span>

</div>

<div class="section desc markdown">

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
    - Updating the current user with the received data.
    - Refreshing the access token.
    - Joining a public organization or sending a membership request
      based on the selected organization.

In case of any exceptions during the sign-up process, this function
catches and prints the error and displays a Talawa error snackbar with a
corresponding message.

**params**: None

**returns**: None

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<void>  async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [signup_details_view_model](../../view_model_pre_auth_view_models_signup_details_view_model/view_model_pre_auth_view_models_signup_details_view_model-library.md)
3.  [SignupDetailsViewModel](../../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel-class.md)
4.  signUp method

##### SignupDetailsViewModel class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
