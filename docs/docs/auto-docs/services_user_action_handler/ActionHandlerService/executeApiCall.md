




executeApiCall method - ActionHandlerService class - user\_action\_handler library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_action\_handler.dart](../../services_user_action_handler/services_user_action_handler-library.html)
3. [ActionHandlerService](../../services_user_action_handler/ActionHandlerService-class.html)
4. executeApiCall method

executeApiCall


dark\_mode

light\_mode




# executeApiCall method


Future<bool?>
executeApiCall({

1. required Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>?> action(),
2. Future<void> onValidResult(
   1. [QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>)?,
3. Future<void> onActionException(
   1. Exception e)?,
4. Future<void> onActionFinally()?,

})

Method to execute an API action.

**params**:

* `action`: A function that performs the API call and returns a `Future<QueryResult<Object?>?>`.
* `onValidResult`: A function to handle the result when the API call is successful.
* `onActionException`: A function to handle exceptions that occur during the API call.
* `onActionFinally`: A function to execute regardless of the success or failure of the API call.

**returns**:

* `Future<bool?>`: that indicates the success (`true`), failure (`false`), or null if the result is invalid.

## Implementation

```
Future<bool?> executeApiCall({
  required Future<QueryResult<Object?>?> Function() action,
  Future<void> Function(QueryResult<Object?>)? onValidResult,
  Future<void> Function(Exception e)? onActionException,
  Future<void> Function()? onActionFinally,
}) async {
  try {
    final result = await action();
    print(result);
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
```

 


1. [talawa](../../index.html)
2. [user\_action\_handler](../../services_user_action_handler/services_user_action_handler-library.html)
3. [ActionHandlerService](../../services_user_action_handler/ActionHandlerService-class.html)
4. executeApiCall method

##### ActionHandlerService class





talawa
1.0.0+1






