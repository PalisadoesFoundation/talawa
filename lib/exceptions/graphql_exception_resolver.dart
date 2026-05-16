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

  /// Field-level "not authorized" message treated as non-fatal.
  ///
  /// When a GraphQL response carries this error alongside partial data, the
  /// resolver should still let the data flow through to callers.
  static const String notAuthorizedMessage =
      'You are not authorized to perform this action.';

  /// Message returned by the new Talawa API when the access token is missing
  /// or expired (paired with `extensions.code: "unauthenticated"`).
  static const String userMustBeAuthenticatedMessage =
      'You must be authenticated to perform this action.';

  /// Single-flight future for a pending access-token refresh.
  ///
  /// Concurrent auth-failure paths share the same refresh attempt instead of
  /// each kicking off their own (which would race the refresh-token rotation
  /// and almost always blow up).
  static Future<bool>? _refreshFuture;

  /// Returns true when [error] indicates the access token is missing/expired.
  ///
  /// Detects both the legacy message strings and the new API's
  /// `extensions.code: "unauthenticated"` marker. Matching on the extension
  /// code is preferred because messages are localizable.
  static bool _isAuthExpired(GraphQLError error) {
    final code = (error.extensions?['code'] as String?)?.toLowerCase();
    if (code == 'unauthenticated') return true;
    final msg = error.message;
    return msg == userNotAuthenticated.message ||
        msg == refreshAccessTokenExpiredException.message ||
        msg == userMustBeAuthenticatedMessage;
  }

  /// Awaits any in-flight token refresh, kicking one off if none is running.
  ///
  /// Use this from the auth query/mutation retry paths so the retried request
  /// runs against the freshly-rotated [clientAuth] instead of the stale one.
  static Future<bool> awaitRefresh() {
    final existing = _refreshFuture;
    if (existing != null) return existing;

    final refreshToken = userConfig.currentUser.refreshToken;
    if (refreshToken == null || refreshToken.isEmpty) {
      return Future.value(false);
    }

    final future = _runRefresh(refreshToken);
    _refreshFuture = future;
    future.whenComplete(() {
      if (_refreshFuture == future) _refreshFuture = null;
    });
    return future;
  }

  /// Performs a single access-token refresh and rebuilds the auth client.
  ///
  /// On failure (refresh token expired/invalid, or the mutation itself threw),
  /// forces a silent logout so we don't loop calling a refresh endpoint that
  /// will never succeed — which is what historically produced the
  /// `rate_limit_exceeded` storm.
  static Future<bool> _runRefresh(String refreshToken) async {
    try {
      final ok = await databaseFunctions.refreshAccessToken(refreshToken);
      if (ok) {
        graphqlConfig.getToken();
        databaseFunctions.init();
        return true;
      }
      await userConfig.forceSilentLogout();
      return false;
    } catch (e, st) {
      debugPrint('Token refresh failed: $e\n$st');
      await userConfig.forceSilentLogout();
      return false;
    }
  }

  /// This function is used to check if any exceptions or error encountered.
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
      final linkException = exception.linkException;
      final linkError = linkException.toString();
      if (showSnackBar) {
        debugPrint(linkError);
      }

      // graphql_flutter wraps server-side GraphQL errors (with HTTP status
      // 4xx/5xx) in a [ServerException] — that's not a real network failure,
      // it's a domain/auth error the server returned. Treat it as a regular
      // GraphQL error so the per-error logic below decides how to surface it.
      final parsedErrors = linkException is ServerException
          ? linkException.parsedResponse?.errors
          : null;
      if (parsedErrors != null && parsedErrors.isNotEmpty) {
        return _handleGraphqlErrors(parsedErrors, showSnackBar);
      }

      if (showSnackBar) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => navigationService.showTalawaErrorSnackBar(
            "Network issue while contacting server: $linkError",
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

    return _handleGraphqlErrors(exception.graphqlErrors, showSnackBar);
  }

  /// Routes a list of [GraphQLError]s through the per-error UI/refresh logic.
  ///
  /// Extracted so both the direct GraphQL-error path and the
  /// [ServerException]-wrapped path (where graphql_flutter buries the parsed
  /// errors inside [linkException]) share the same handling.
  static bool _handleGraphqlErrors(
    List<GraphQLError> errors,
    bool showSnackBar,
  ) {
    if (showSnackBar) {
      debugPrint(errors.toString());
    }

    for (final error in errors) {
      final code = (error.extensions?['code'] as String?)?.toLowerCase();
      final httpStatus = error.extensions?['httpStatus'] as int?;

      /// Non-fatal: field-level "not authorized" (e.g. path [user] when other data succeeded).
      if (error.message == notAuthorizedMessage) return false;

      /// Server rate-limited the request. Don't retry — the caller's
      /// SWR/cache fallback will surface stale data, and any retry here
      /// would amplify the burst that triggered the limit in the first
      /// place. Suppress the generic dialog so users don't see a popup
      /// for every queued request during the burst.
      if (code == 'rate_limit_exceeded' || httpStatus == 429) {
        return false;
      }

      /// Token expired / missing — kick off a single-flight refresh and
      /// signal the caller to retry. Detects both legacy messages and the
      /// new API's `extensions.code: "unauthenticated"`.
      if (_isAuthExpired(error)) {
        awaitRefresh();
        return true;
      }

      // Field-level permission denial from the new API. Treat as non-fatal —
      // the caller already gets `null` for the field; we don't surface a
      // generic "something went wrong" snackbar for missing permissions.
      if (code == 'unauthorized_action' ||
          code == 'unauthorized_action_on_arguments_associated_resources' ||
          code == 'forbidden_action_on_arguments_associated_resources' ||
          code == 'forbidden') {
        return false;
      }

      if (error.message == userNotFound.message) {
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

      if (error.message == memberRequestExist.message) {
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

      // New API uses `extensions.code: "invalid_credentials"`; legacy used the
      // message string. Match either so the dialog still shows on bad login.
      if (code == 'invalid_credentials' ||
          error.message == wrongCredentials.message) {
        if (showSnackBar) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => navigationService.showTalawaErrorDialog(
              "Invalid email address or password",
              MessageType.error,
            ),
          );
        }
        return false;
      }

      if (error.message == organizationNotFound.message) {
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

      if (error.message == emailAccountPresent.message) {
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
    // If the error is unknown, only show UI when requested.
    if (showSnackBar) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => navigationService.showTalawaErrorDialog(
          "Something went wrong!",
          MessageType.error,
        ),
      );
    }
    return false;
  }
}
