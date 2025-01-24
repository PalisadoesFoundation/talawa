




ActionHandlerService class - user\_action\_handler library - Dart API







menu

1. [talawa](../index.html)
2. [services/user\_action\_handler.dart](../services_user_action_handler/services_user_action_handler-library.html)
3. ActionHandlerService class

ActionHandlerService


dark\_mode

light\_mode




# ActionHandlerService class


A service class to handle different types of actions, including API calls.

with proper error handling and UI updates based on the action type.


## Constructors

[ActionHandlerService](../services_user_action_handler/ActionHandlerService/ActionHandlerService.html)()




## Properties

[hashCode](../services_user_action_handler/ActionHandlerService/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[runtimeType](../services_user_action_handler/ActionHandlerService/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[executeApiCall](../services_user_action_handler/ActionHandlerService/executeApiCall.html)({required Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>?> action(), Future<void> onValidResult([QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>)?, Future<void> onActionException(Exception e)?, Future<void> onActionFinally()?})
→ Future<bool?>


Method to execute an API action.

[noSuchMethod](../services_user_action_handler/ActionHandlerService/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[performAction](../services_user_action_handler/ActionHandlerService/performAction.html)({required [ActionType](../enums_enums/ActionType.html) actionType, required Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>?> action(), Future<void> onValidResult([QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?> result)?, Future<void> onActionException(Exception e)?, void updateUI()?, void apiCallSuccessUpdateUI()?, String? criticalActionFailureMessage = TalawaErrors.userActionNotSaved, Future<void> onActionFinally()?})
→ Future<void>


Processes a user action based on its type, with error handling and UI update.

[toString](../services_user_action_handler/ActionHandlerService/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](../services_user_action_handler/ActionHandlerService/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [user\_action\_handler](../services_user_action_handler/services_user_action_handler-library.html)
3. ActionHandlerService class

##### user\_action\_handler library





talawa
1.0.0+1






