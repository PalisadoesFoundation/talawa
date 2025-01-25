




encounteredExceptionOrError method - GraphqlExceptionResolver class - graphql\_exception\_resolver library - Dart API







menu

1. [talawa](../../index.html)
2. [exceptions/graphql\_exception\_resolver.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_exceptions_graphql_exception_resolver/)
3. [GraphqlExceptionResolver](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_exceptions_graphql_exception_resolver/GraphqlExceptionResolver-class.html)
4. encounteredExceptionOrError static method

encounteredExceptionOrError


dark\_mode

light\_mode




# encounteredExceptionOrError static method


[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?
encounteredExceptionOrError(

1. dynamic exception, {
2. [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) showSnackBar = true,

})

This function is used to check if any exceptions or error encountered. The return type is `boolean`.

**params**:

* `exception`: OperationException which occur when calling for graphql post request
* `showSnackBar`: Tell if the the place where this function is called wants a SnackBar on error

**returns**:

* `bool?`: returns a bool whether or not their is error, can be null

## Implementation

```
static bool? encounteredExceptionOrError(
  OperationException exception, {
  bool showSnackBar = true,
}) {
  // If server link is wrong.
  if (exception.linkException != null) {
    debugPrint(exception.linkException.toString());
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
    debugPrint(exception.toString());
    if (showSnackBar) {
      navigationService.showCustomToast(exception.actionError);
    }
    return false;
  }

  /// Looping through graphQL errors.
  debugPrint(exception.graphqlErrors.toString());
  for (int i = 0; i < exception.graphqlErrors.length; i++) {
    // if the error message is "Access Token has expired. Please refresh session.: Undefined location"
    if (exception.graphqlErrors[i].message ==
        refreshAccessTokenExpiredException.message) {
      print('token refreshed');
      databaseFunctions
          .refreshAccessToken(userConfig.currentUser.refreshToken!)
          .then(
            (value) => graphqlConfig
                .getToken()
                .then((value) => databaseFunctions.init()),
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
                .getToken()
                .then((value) => databaseFunctions.init()),
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

 


1. [talawa](../../index.html)
2. [graphql\_exception\_resolver](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_exceptions_graphql_exception_resolver/)
3. [GraphqlExceptionResolver](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_exceptions_graphql_exception_resolver/GraphqlExceptionResolver-class.html)
4. encounteredExceptionOrError static method

##### GraphqlExceptionResolver class





talawa
1.0.0+1






