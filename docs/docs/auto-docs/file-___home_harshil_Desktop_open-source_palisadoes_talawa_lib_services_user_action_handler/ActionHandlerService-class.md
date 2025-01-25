




ActionHandlerService class - user\_action\_handler library - Dart API







menu

1. [talawa](../index.html)
2. [services/user\_action\_handler.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_action_handler/)
3. ActionHandlerService class

ActionHandlerService


dark\_mode

light\_mode




# ActionHandlerService class


A service class to handle different types of actions, including API calls.

with proper error handling and UI updates based on the action type.


## Constructors

[ActionHandlerService](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_action_handler/ActionHandlerService/ActionHandlerService.html)()




## Properties

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited



## Methods

[executeApiCall](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_action_handler/ActionHandlerService/executeApiCall.html)({required [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html) action(), [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void> onValidResult(dynamic)?, [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void> onActionException([Exception](https://api.flutter.dev/flutter/dart-core/Exception-class.html) e)?, [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void> onActionFinally()?})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?>


Method to execute an API action.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[performAction](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_action_handler/ActionHandlerService/performAction.html)({required dynamic actionType, required [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html) action(), [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void> onValidResult(dynamic result)?, [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void> onActionException([Exception](https://api.flutter.dev/flutter/dart-core/Exception-class.html) e)?, void updateUI()?, void apiCallSuccessUpdateUI()?, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? criticalActionFailureMessage = TalawaErrors.userActionNotSaved, [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void> onActionFinally()?})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Processes a user action based on its type, with error handling and UI update.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [user\_action\_handler](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_action_handler/)
3. ActionHandlerService class

##### user\_action\_handler library





talawa
1.0.0+1






