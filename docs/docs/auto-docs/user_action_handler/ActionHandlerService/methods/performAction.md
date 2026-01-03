# Method: `performAction`

## Description

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

## Return Type
`Future<void>`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
