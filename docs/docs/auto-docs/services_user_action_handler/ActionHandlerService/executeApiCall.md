
<div>

# executeApiCall method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]\>]]




Method to execute an API action.

**params**:

-   `action`: A function that performs the API call and returns a
    `Future<QueryResult<Object?>?>`.
-   `onValidResult`: A function to handle the result when the API call
    is successful.
-   `onActionException`: A function to handle exceptions that occur
    during the API call.
-   `onActionFinally`: A function to execute regardless of the success
    or failure of the API call.

**returns**:

-   `Future<bool?>`: that indicates the success (`true`), failure
    (`false`), or null if the result is invalid.



## Implementation

``` language-dart
Future<bool?>  async 
```







1.  [talawa](../../index.md)
2.  [user_action_handler](../../services_user_action_handler/)
3.  [ActionHandlerService](../../services_user_action_handler/ActionHandlerService-class.md)
4.  executeApiCall method

##### ActionHandlerService class







