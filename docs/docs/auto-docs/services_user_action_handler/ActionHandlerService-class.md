
<div>

# ActionHandlerService class

</div>


A service class to handle different types of actions, including API
calls.

with proper error handling and UI updates based on the action type.



## Constructors

[ActionHandlerService](../services_user_action_handler/ActionHandlerService/ActionHandlerService.md)

:   



## Properties

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[executeApiCall](../services_user_action_handler/ActionHandlerService/executeApiCall.md)][({[required [[Future](https://api.flutter.dev/flutter/dart-core/Future-class.md)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]?]\>]] , ][[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] onValidResult([[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.md)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]])?, ][[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] onActionException([[[Exception](https://api.flutter.dev/flutter/dart-core/Exception-class.md)] e])?, ][[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ?]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]\>]] ]
:   Method to execute an API action.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[performAction](../services_user_action_handler/ActionHandlerService/performAction.md)][({[required [[ActionType](../enums_enums/ActionType.md)] actionType, ][required [[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]?]\>]] , ][[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] onValidResult([[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.md)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]] result])?, ][[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] onActionException([[[Exception](https://api.flutter.dev/flutter/dart-core/Exception-class.md)] e])?, ][void ?, ][void ?, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] criticalActionFailureMessage = TalawaErrors.userActionNotSaved, ][[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ?]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Processes a user action based on its type, with error handling and
    UI update.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [user_action_handler](../services_user_action_handler/)
3.  ActionHandlerService class

##### user_action_handler library







