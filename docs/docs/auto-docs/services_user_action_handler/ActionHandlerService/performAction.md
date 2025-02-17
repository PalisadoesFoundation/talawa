
<div>

# performAction method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
performAction({

1.  [required
    [[ActionType](../../enums_enums/ActionType.html)]
    actionType, ]
2.  [required
    [[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]?]\>]]
    , ]
3.  [[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
    onValidResult(]
    1.  [[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]
        result]

    )?,
4.  [[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
    onActionException(]
    1.  [[[Exception](https://api.flutter.dev/flutter/dart-core/Exception-class.html)]
        e]

    )?,
5.  [void ?,
    ]
6.  [void
    ?,
    ]
7.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
    criticalActionFailureMessage =
    TalawaErrors.userActionNotSaved,
    ]
8.  [[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
    ?,
    ]

})



Processes a user action based on its type, with error handling and UI
update.

**params**:

-   `actionType`: Specifies whether the action is optimistic or
    critical.
-   `action`: The action to perform, which returns a
    `Future<QueryResult<Object?>?>`.
-   `onValidResult`: A function to handle the result when the action is
    successful.
-   `onActionException`: A function to handle exceptions that occur
    during the action.
-   `updateUI`: A function to update the UI immediately for optimistic
    actions or after API call for critical actions.
-   `apiCallSuccessUpdateUI`: A function to update the UI upon
    successful API call.
-   `criticalActionFailureMessage`: The error message to use when a
    critical action fails.
-   `onActionFinally`: A function to execute regardless of the success
    or failure of the action.

**returns**: None



## Implementation

``` language-dart
Future<void> performAction({
  required ActionType actionType,
  required Future<QueryResult<Object?>?>  action,
  Future<void> Function(QueryResult<Object?> result)? onValidResult,
  Future<void> Function(Exception e)? onActionException,
  void ? updateUI,
  void ? apiCallSuccessUpdateUI,
  String? criticalActionFailureMessage = TalawaErrors.userActionNotSaved,
  Future<void> ? onActionFinally,
}) async {
  bool? success;
  // optimistic
  if (actionType == ActionType.optimistic) {
    // Update UI immediately for optimistic actions
    updateUI?.;
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
      updateUI?.;
      if (success ?? false) {
        apiCallSuccessUpdateUI?.;
      }
    } else {
      updateUI?.;
      GraphqlExceptionResolver.encounteredExceptionOrError(
        CriticalActionException(criticalActionFailureMessage!),
      );
    }
  }
}
```







1.  [talawa](../../index.html)
2.  [user_action_handler](../../services_user_action_handler/)
3.  [ActionHandlerService](../../services_user_action_handler/ActionHandlerService-class.html)
4.  performAction method

##### ActionHandlerService class







