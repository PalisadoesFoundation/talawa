import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/app_strings.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/exceptions/critical_action_exception.dart';
import 'package:talawa/locator.dart';

/// static class to handle graphql exceptions.
class GraphqlExceptionResolver {
  /// Graphql error for handling.
  static GraphQLError userNotFound =
      const GraphQLError(message: TalawaErrors.userNotFound);

  /// Graphql error for handling.
  static GraphQLError userNotAuthenticated =
      const GraphQLError(message: TalawaErrors.userNotAuthenticated);

  /// Graphql error for handling.
  static GraphQLError emailAccountPresent =
      const GraphQLError(message: TalawaErrors.emailAccountPresent);

  /// Graphql error for handling.
  static GraphQLError wrongCredentials =
      const GraphQLError(message: TalawaErrors.wrongCredentials);

  /// Graphql error for handling.
  static GraphQLError organizationNotFound =
      const GraphQLError(message: TalawaErrors.organizationNotFound);

  /// Graphql error for handling.
  static GraphQLError refreshAccessTokenExpiredException = const GraphQLError(
    message: TalawaErrors.refreshAccessTokenExpiredException,
  );

  /// Graphql error for handling.
  static GraphQLError memberRequestExist =
      const GraphQLError(message: TalawaErrors.memberRequestExist);

  /// Graphql error for handling.
  static GraphQLError notifFeatureNotInstalled = const GraphQLError(
    message: TalawaErrors.failedToDetermineProject,
  );

  /// This function is used to check if any exceptions or error encountered. The return type is [boolean].
  ///
  /// **params**:
  /// * `exception`: OperationException which occur when calling for graphql post request
  /// * `showSnackBar`: Tell if the the place where this function is called wants a SnackBar on error
  ///
  /// **returns**:
  /// * `bool?`: returns a bool whether or not their is error, can be null
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
}
