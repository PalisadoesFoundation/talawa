<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [login_view_model](../../view_model_pre_auth_view_models_login_view_model/view_model_pre_auth_view_models_login_view_model-library.md)
3.  [LoginViewModel](../../view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.md)
4.  login method

<div class="self-name">

login

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_pre_auth_view_models_login_view_model/LoginViewModel-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">login</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span>
<span class="name">login</span>

</div>

<div class="section desc markdown">

Performs the login operation.

Handles the login process by performing the following steps:

1.  Unfocusing the email and password text fields.
2.  Setting validation mode to `AutovalidateMode.always`.
3.  Validating the email and password fields using the form key.
4.  If validation is successful, disabling auto-validation mode and
    initiating the login process.
5.  Displaying a custom progress dialog during login.
6.  Initializing database functions.
7.  Performing a GraphQL mutation to login the user by providing the
    email and encrypted password.
8.  Handling the result of the login operation:
    - Updating the current user with the received data.
    - Redirecting the user based on their status in the application.
    - Handling Firebase options for Android and iOS if available.
    - Configuring Firebase and saving FCM token to the database.

In case of any exceptions during the login process, this function
catches and prints the error.

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
2.  [login_view_model](../../view_model_pre_auth_view_models_login_view_model/view_model_pre_auth_view_models_login_view_model-library.md)
3.  [LoginViewModel](../../view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.md)
4.  login method

##### LoginViewModel class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
