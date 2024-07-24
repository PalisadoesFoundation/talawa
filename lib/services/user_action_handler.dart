import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/app_strings.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/exceptions/critical_action_exception.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';

class ActionHandlerService {
  // Method to execute an API action
  Future<bool?> executeApiCall({
    required Future<QueryResult<Object?>?> Function() action,
    required Future<void> Function(QueryResult<Object?>) onValidResult,
    Future<void> Function(Exception e)? onActionException,
    Future<void> Function()? onActionFinally,
  }) async {
    try {
      final result = await action();
      if (result == null || result.data == null) return null;
      if (result.isConcrete && result.source != QueryResultSource.cache) {
      print(result);
        onValidResult(result);
      }
      return true;
    } catch (e) {
      onActionException?.call(e as Exception);
      return false;
    } finally {
      onActionFinally?.call();
    }
  }

  /// Processes a user action based on its type, with error handling and UI update.
  ///
  /// **params**:
  /// * `actionType`: Specifies whether the action is optimistic or critical.
  /// * `action`: The action to perform, which returns a Future.
  /// * `apiCallSuccessUpdateUI`: Function to update the UI upon success.
  /// * `onFailure`: Function to handle failure scenarios.
  ///
  /// **returns**:
  ///   None
  Future<void> performAction({
    required ActionType actionType,
    required Future<QueryResult<Object?>?> Function() action,
    required Future<void> Function(QueryResult<Object?> result) onValidResult,
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
        databaseFunctions.encounteredExceptionOrError(
          CriticalActionException(criticalActionFailureMessage!),
        );
      }
    }
  }
}
