




performAction method - ActionHandlerService class - user\_action\_handler library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_action\_handler.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_action_handler/)
3. [ActionHandlerService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_action_handler/ActionHandlerService-class.html)
4. performAction method

performAction


dark\_mode

light\_mode




# performAction method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
performAction({

1. required dynamic actionType,
2. required [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html) action(),
3. [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void> onValidResult(
   1. dynamic result)?,
4. [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void> onActionException(
   1. [Exception](https://api.flutter.dev/flutter/dart-core/Exception-class.html) e)?,
5. void updateUI()?,
6. void apiCallSuccessUpdateUI()?,
7. [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? criticalActionFailureMessage = TalawaErrors.userActionNotSaved,
8. [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void> onActionFinally()?,

})

Processes a user action based on its type, with error handling and UI update.

**params**:

* `actionType`: Specifies whether the action is optimistic or critical.
* `action`: The action to perform, which returns a `Future<QueryResult<Object?>?>`.
* `onValidResult`: A function to handle the result when the action is successful.
* `onActionException`: A function to handle exceptions that occur during the action.
* `updateUI`: A function to update the UI immediately for optimistic actions or after API call for critical actions.
* `apiCallSuccessUpdateUI`: A function to update the UI upon successful API call.
* `criticalActionFailureMessage`: The error message to use when a critical action fails.
* `onActionFinally`: A function to execute regardless of the success or failure of the action.

**returns**:
None


## Implementation

```
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
```

 


1. [talawa](../../index.html)
2. [user\_action\_handler](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_action_handler/)
3. [ActionHandlerService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_action_handler/ActionHandlerService-class.html)
4. performAction method

##### ActionHandlerService class





talawa
1.0.0+1






