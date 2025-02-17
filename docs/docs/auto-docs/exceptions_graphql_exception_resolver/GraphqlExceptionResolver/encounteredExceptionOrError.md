
<div>

# encounteredExceptionOrError static method

</div>


[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]
encounteredExceptionOrError(

1.  [[[OperationException](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException-class.md)]
    exception,
    {]
2.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
    showSnackBar = true,
    ]

})



This function is used to check if any exceptions or error encountered.
The return type is `boolean`.

**params**:

-   `exception`: OperationException which occur when calling for graphql
    post request
-   `showSnackBar`: Tell if the the place where this function is called
    wants a SnackBar on error

**returns**:

-   `bool?`: returns a bool whether or not their is error, can be null



## Implementation

``` language-dart
static bool? encounteredExceptionOrError(
  OperationException exception, {
  bool showSnackBar = true,
}) {
  // If server link is wrong.
  if (exception.linkException != null) {
    debugPrint(exception.linkException.);
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

  if (exception is CriticalActionException) {
    debugPrint(exception.);
    if (showSnackBar) {
      navigationService.showCustomToast(exception.actionError);
    }
    return false;
  }

  /// Looping through graphQL errors.
  debugPrint(exception.graphqlErrors.);
  for (int i = 0; i < exception.graphqlErrors.length; i++) {
    // if the error message is "Access Token has expired. Please refresh session.: Undefined location"
    if (exception.graphqlErrors[i].message ==
        refreshAccessTokenExpiredException.message) {
      print('token refreshed');
      databaseFunctions
          .refreshAccessToken(userConfig.currentUser.refreshToken!)
          .then(
            (value) => graphqlConfig
                .
                .then((value) => databaseFunctions.),
          );
      print('client refreshed');
      return true;
    }

    /// If the error message is "User is not authenticated"
    if (exception.graphqlErrors[i].message == userNotAuthenticated.message) {
      print('client refreshed');
      databaseFunctions
          .refreshAccessToken(userConfig.currentUser.refreshToken!)
          .then(
            (value) => graphqlConfig
                .
                .then((value) => databaseFunctions.),
          );
      return true;
    }

    /// If the error message is "User not found"
    if (exception.graphqlErrors[i].message == userNotFound.message) {
      print(showSnackBar);
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

    /// If the error message is "Membership Request already exists"
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

    /// If the error message is "Invalid credentials"
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

    /// If the error message is "Organization not found"
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

    /// If the error message is "Email address already exists"
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
  }
  // If the error is unknown
  WidgetsBinding.instance.addPostFrameCallback(
    (_) => navigationService.showTalawaErrorDialog(
      "Something went wrong!",
      MessageType.error,
    ),
  );
  return false;
}
```







1.  [talawa](../../index.md)
2.  [graphql_exception_resolver](../../exceptions_graphql_exception_resolver/)
3.  [GraphqlExceptionResolver](../../exceptions_graphql_exception_resolver/GraphqlExceptionResolver-class.md)
4.  encounteredExceptionOrError static method

##### GraphqlExceptionResolver class







