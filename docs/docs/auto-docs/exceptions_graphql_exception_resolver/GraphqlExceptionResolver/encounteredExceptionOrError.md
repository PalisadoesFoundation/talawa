::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [exceptions/graphql_exception_resolver.dart](../../exceptions_graphql_exception_resolver/)
3.  [GraphqlExceptionResolver](../../exceptions_graphql_exception_resolver/GraphqlExceptionResolver-class.html)
4.  encounteredExceptionOrError static method

::: self-name
encounteredExceptionOrError
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="exceptions_graphql_exception_resolver/GraphqlExceptionResolver-class-sidebar.html" below-sidebar=""}
<div>

# [encounteredExceptionOrError]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.returntype}
[encounteredExceptionOrError]{.name}(

1.  [[[OperationException](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException-class.html)]{.type-annotation}
    [exception]{.parameter-name},
    {]{#encounteredExceptionOrError-param-exception .parameter}
2.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [showSnackBar]{.parameter-name} = [true]{.default-value},
    ]{#encounteredExceptionOrError-param-showSnackBar .parameter}

})
:::

::: {.section .desc .markdown}
This function is used to check if any exceptions or error encountered.
The return type is `boolean`.

**params**:

-   `exception`: OperationException which occur when calling for graphql
    post request
-   `showSnackBar`: Tell if the the place where this function is called
    wants a SnackBar on error

**returns**:

-   `bool?`: returns a bool whether or not their is error, can be null
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [graphql_exception_resolver](../../exceptions_graphql_exception_resolver/)
3.  [GraphqlExceptionResolver](../../exceptions_graphql_exception_resolver/GraphqlExceptionResolver-class.html)
4.  encounteredExceptionOrError static method

##### GraphqlExceptionResolver class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
