




CriticalActionException class - critical\_action\_exception library - Dart API







menu

1. [talawa](../index.html)
2. [exceptions/critical\_action\_exception.dart](../exceptions_critical_action_exception/exceptions_critical_action_exception-library.html)
3. CriticalActionException class

CriticalActionException


dark\_mode

light\_mode




# CriticalActionException class


Exception thrown for critical actions that require special handling.

Extends [OperationException](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException-class.html) to integrate with GraphQL error handling.


Inheritance

* Object
* [OperationException](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException-class.html)
* CriticalActionException



## Constructors

[CriticalActionException](../exceptions_critical_action_exception/CriticalActionException/CriticalActionException.html)(String actionError)

Constructor for [CriticalActionException](../exceptions_critical_action_exception/CriticalActionException-class.html).



## Properties

[actionError](../exceptions_critical_action_exception/CriticalActionException/actionError.html)
↔ String

The error message associated with this critical action.
getter/setter pair

[graphqlErrors](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/graphqlErrors.html)
↔ List<[GraphQLError](https://pub.dev/documentation/gql_exec/1.1.1-alpha+1699813812660/graphql_flutter/GraphQLError-class.html)>

Any graphql errors returned from the operation
getter/setter pairinherited

[hashCode](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[linkException](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/linkException.html)
↔ [LinkException](https://pub.dev/documentation/gql_link/1.0.1-alpha+1705114622987/graphql_flutter/LinkException-class.html)?

Errors encountered during execution such as network or cache errors
getter/setter pairinherited

[originalStackTrace](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/originalStackTrace.html)
↔ StackTrace?

getter/setter pairinherited

[raw](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/raw.html)
↔ List?

getter/setter pairinherited

[runtimeType](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[addError](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/addError.html)([GraphQLError](https://pub.dev/documentation/gql_exec/1.1.1-alpha+1699813812660/graphql_flutter/GraphQLError-class.html) error)
→ void


inherited

[noSuchMethod](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toString](../exceptions_critical_action_exception/CriticalActionException/toString.html)()
→ String


A string representation of this object.
override



## Operators

[operator ==](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [critical\_action\_exception](../exceptions_critical_action_exception/exceptions_critical_action_exception-library.html)
3. CriticalActionException class

##### critical\_action\_exception library





talawa
1.0.0+1






