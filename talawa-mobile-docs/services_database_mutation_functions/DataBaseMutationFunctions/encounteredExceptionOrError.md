


# encounteredExceptionOrError method








[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)? encounteredExceptionOrError
([OperationException](https://pub.dev/documentation/graphql/5.2.0-beta.4/graphql/OperationException-class.html) exception, {[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) showSnackBar = true})





<p>This function is used to check if any exceptions or error encountered. The return type is <code>boolean</code>.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>exception</code>: OperationException which occur when calling for graphql post request</li>
<li><code>showSnackBar</code>: Tell if the the place where this function is called wants a SnackBar on error</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>bool?</code>: returns a bool whether or not their is error, can be null</li>
</ul>



## Implementation

```dart
bool? encounteredExceptionOrError(
  OperationException exception, {
  bool showSnackBar = true,
}) {
  // if server link is wrong.
  if (exception.linkException != null) {
    // debugPrint(exception.linkException.toString());
    if (showSnackBar) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => navigationService.showTalawaErrorSnackBar(
          "Server not running/wrong url",
          MessageType.info,
        ),
      );
    }
    return false;
  }

  /// looping through graphQL errors.
  debugPrint(exception.graphqlErrors.toString());
  for (int i = 0; i < exception.graphqlErrors.length; i++) {
    // if the error message is "Access Token has expired. Please refresh session.: Undefined location"
    if (exception.graphqlErrors[i].message ==
        refreshAccessTokenExpiredException.message) {
      print('token refreshed');
      refreshAccessToken(userConfig.currentUser.refreshToken!).then(
        (value) => graphqlConfig
            .getToken()
            .then((value) => databaseFunctions.init()),
      );
      print('client refreshed');
      return true;
    }

    /// if the error message is "User is not authenticated"
    if (exception.graphqlErrors[i].message == userNotAuthenticated.message) {
      print('client refreshed');
      refreshAccessToken(userConfig.currentUser.refreshToken!).then(
        (value) => graphqlConfig
            .getToken()
            .then((value) => databaseFunctions.init()),
      );
      return true;
    }

    /// if the error message is "User not found"
    if (exception.graphqlErrors[i].message == userNotFound.message) {
      if (showSnackBar) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => navigationService.showTalawaErrorDialog(
            "No account registered with this email",
            MessageType.error,
          ),
        );
      }
      return false;
    }

    /// if the error message is "Membership Request already exists"
    if (exception.graphqlErrors[i].message == memberRequestExist.message) {
      if (showSnackBar) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => navigationService.showTalawaErrorDialog(
            "Membership request already exist",
            MessageType.error,
          ),
        );
      }
      return false;
    }

    /// if the error message is "Invalid credentials"
    if (exception.graphqlErrors[i].message == wrongCredentials.message) {
      if (showSnackBar) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => navigationService.showTalawaErrorDialog(
            "Enter a valid password",
            MessageType.error,
          ),
        );
      }
      return false;
    }

    /// if the error message is "Organization not found"
    if (exception.graphqlErrors[i].message == organizationNotFound.message) {
      if (showSnackBar) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => navigationService.showTalawaErrorDialog(
            "Organization Not Found",
            MessageType.error,
          ),
        );
      }
      return false;
    }

    /// if the error message is "Email address already exists"
    if (exception.graphqlErrors[i].message == emailAccountPresent.message) {
      if (showSnackBar) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => navigationService.showTalawaErrorDialog(
            "Account with this email already registered",
            MessageType.error,
          ),
        );
      }
      return false;
    }
    if (exception.graphqlErrors[i].message ==
        notifFeatureNotInstalled.message) {
      if (showSnackBar) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => navigationService.showTalawaErrorDialog(
            "Notification Feature is not installed",
            MessageType.error,
          ),
        );
      }
      return false;
    }
  }
  // if the error is unknown

  WidgetsBinding.instance.addPostFrameCallback(
    (_) => navigationService.showTalawaErrorDialog(
      "Something went wrong!",
      MessageType.error,
    ),
  );
  return false;
}
```







