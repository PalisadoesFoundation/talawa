
<div>

# CriticalActionException class

</div>


Exception thrown for critical actions that require special handling.

Extends
[OperationException](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException-class.html)
to integrate with GraphQL error handling.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [OperationException](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException-class.html)
    -   CriticalActionException



## Constructors

[[CriticalActionException](../exceptions_critical_action_exception/CriticalActionException/CriticalActionException.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] actionError])]
:   Constructor for
    [CriticalActionException](../exceptions_critical_action_exception/CriticalActionException-class.html).



## Properties

[[actionError](../exceptions_critical_action_exception/CriticalActionException/actionError.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   The error message associated with this critical action.
    ::: features
    getter/setter pair
    :::

[[graphqlErrors](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/graphqlErrors.html)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[GraphQLError](https://pub.dev/documentation/gql_exec/1.1.1-alpha+1699813812660/graphql_flutter/GraphQLError-class.html)]\>]]
:   Any graphql errors returned from the operation
    ::: features
    getter/setter pairinherited
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[linkException](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/linkException.html)] [↔ [LinkException](https://pub.dev/documentation/gql_link/1.0.1-alpha+1705114622987/graphql_flutter/LinkException-class.html)?]
:   Errors encountered during execution such as network or cache errors
    ::: features
    getter/setter pairinherited
    :::

[[originalStackTrace](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/originalStackTrace.html)] [↔ [StackTrace](https://api.flutter.dev/flutter/dart-core/StackTrace-class.html)?]

:   ::: features
    getter/setter pairinherited
    :::

[[raw](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/raw.html)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)?]

:   ::: features
    getter/setter pairinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[addError](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/addError.html)][([[[GraphQLError](https://pub.dev/documentation/gql_exec/1.1.1-alpha+1699813812660/graphql_flutter/GraphQLError-class.html)] error]) → void ]

:   ::: features
    inherited
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[toString](../exceptions_critical_action_exception/CriticalActionException/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    override
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [critical_action_exception](../exceptions_critical_action_exception/)
3.  CriticalActionException class

##### critical_action_exception library







