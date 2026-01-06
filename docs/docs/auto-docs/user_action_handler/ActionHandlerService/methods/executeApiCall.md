# Method: `executeApiCall`

## Description

Method to execute an API action.

 **params**:
 * `action`: A function that performs the API call and returns a `Future<QueryResult<Object?>?>`.
 * `onValidResult`: A function to handle the result when the API call is successful.
 * `onActionException`: A function to handle exceptions that occur during the API call.
 * `onActionFinally`: A function to execute regardless of the success or failure of the API call.

 **returns**:
 * `Future<bool?>`: that indicates the success (`true`), failure (`false`), or null if the result is invalid.

## Return Type
`Future<bool?>`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
