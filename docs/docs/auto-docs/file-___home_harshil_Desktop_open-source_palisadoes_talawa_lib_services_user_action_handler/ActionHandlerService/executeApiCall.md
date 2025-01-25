




executeApiCall method - ActionHandlerService class - user\_action\_handler library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_action\_handler.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_action_handler/)
3. [ActionHandlerService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_action_handler/ActionHandlerService-class.html)
4. executeApiCall method

executeApiCall


dark\_mode

light\_mode




# executeApiCall method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?>
executeApiCall({

1. required [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html) action(),
2. [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void> onValidResult(
   1. dynamic)?,
3. [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void> onActionException(
   1. [Exception](https://api.flutter.dev/flutter/dart-core/Exception-class.html) e)?,
4. [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void> onActionFinally()?,

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
2. [user\_action\_handler](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_action_handler/)
3. [ActionHandlerService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_action_handler/ActionHandlerService-class.html)
4. executeApiCall method

##### ActionHandlerService class





talawa
1.0.0+1






