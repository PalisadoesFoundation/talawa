import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/app_strings.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/exceptions/critical_action_exception.dart';
import 'package:talawa/exceptions/graphql_exception_resolver.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';

/// A service class to handle different types of actions, including API calls.
///
/// with proper error handling and UI updates based on the action type.
class ActionHandlerService {
  /// Method to execute an API action.
  ///
  /// **params**:
  /// * `action`: A function that performs the API call and returns a `Future<QueryResult<Object?>?>`.
  /// * `onValidResult`: A function to handle the result when the API call is successful.
  /// * `onActionException`: A function to handle exceptions that occur during the API call.
  /// * `onActionFinally`: A function to execute regardless of the success or failure of the API call.
  ///
  /// **returns**:
  /// * `Future<bool?>`: that indicates the success (`true`), failure (`false`), or null if the result is invalid.
  Future<bool?> executeApiCall({
    required Future<QueryResult<Object?>?> Function() action,
    Future<void> Function(QueryResult<Object?>)? onValidResult,
    Future<void> Function(Exception e)? onActionException,
    Future<void> Function()? onActionFinally,
  }) async {
    try {
      final result = await action();
      if (result == null || result.data == null) return null;

      if (result.isConcrete && result.source != QueryResultSource.cache) {
        await onValidResult!(result);
      }
      return true;
    } catch (e) {
      await onActionException?.call(e as Exception);
      return false;
    } finally {
      await onActionFinally?.call();
    }
  }

  /// Processes a user action based on its type, with error handling and UI update.
  ///
  /// **params**:
  /// * `actionType`: Specifies whether the action is optimistic or critical.
  /// * `action`: The action to perform, which returns a `Future<QueryResult<Object?>?>`.
  /// * `onValidResult`: A function to handle the result when the action is successful.
  /// * `onActionException`: A function to handle exceptions that occur during the action.
  /// * `updateUI`: A function to update the UI immediately for optimistic actions or after API call for critical actions.
  /// * `apiCallSuccessUpdateUI`: A function to update the UI upon successful API call.
  /// * `criticalActionFailureMessage`: The error message to use when a critical action fails.
  /// * `onActionFinally`: A function to execute regardless of the success or failure of the action.
  ///
  /// **returns**:
  ///   None
  Future<void> performAction({
    required ActionType actionType,
    required Future<QueryResult<Object?>?> Function() action,
    Future<void> Function(QueryResult<Object?> result)? onValidResult,
    Future<void> Function(Exception e)? onActionException,
    void Function()? updateUI,
    void Function()? apiCallSuccessUpdateUI,
    String? criticalActionFailureMessage = TalawaErrors.userActionNotSaved,
    Future<void> Function()? onActionFinally,
  }) async {
    bool? success;
    // optimistic
    if (actionType == ActionType.optimistic) {
      // Update UI immediately for optimistic actions
      updateUI?.call();
      success = await executeApiCall(
        action: action,
        onValidResult: onValidResult,
        onActionException: onActionException,
        onActionFinally: onActionFinally,
      );
    } else {
      if (AppConnectivity.isOnline) {
        // Perform critical action with UI update after API call
        success = await executeApiCall(
          action: action,
          onValidResult: onValidResult,
          onActionException: onActionException,
          onActionFinally: onActionFinally,
        );
        updateUI?.call();
        if (success ?? false) {
          apiCallSuccessUpdateUI?.call();
        }
      } else {
        updateUI?.call();
        GraphqlExceptionResolver.encounteredExceptionOrError(
          CriticalActionException(criticalActionFailureMessage!),
        );
      }
    }
  }
}
