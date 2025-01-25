




CachedUserAction class - cached\_user\_action library - Dart API







menu

1. [talawa](../index.html)
2. [models/caching/cached\_user\_action.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/)
3. CachedUserAction class

CachedUserAction


dark\_mode

light\_mode




# CachedUserAction class


CachedUserAction class represents a user action that is cached for offline use.

This class provides the following functionalities:

* `toJson` : converts a CachedUserAction to a JSON-compatible map.
* `fromJson` : creates a CachedUserAction from a JSON-compatible map.
* `execute` : executes the cached user action based on its operation type.

## Constructors

[CachedUserAction](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserAction/CachedUserAction.html)({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) id, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) operation, [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>? variables, required [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html) timeStamp, required dynamic status, [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>? metaData, required dynamic operationType, required [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html) expiry})


[CachedUserAction.fromJson](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserAction/CachedUserAction.fromJson.html)([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json)

Creates a CachedUserAction from a JSON-compatible map.
factory



## Properties

[expiry](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserAction/expiry.html)
↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)

The expiry date and time for the cached user action.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[id](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserAction/id.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

The unique identifier for the cached user action.
getter/setter pair

[metaData](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserAction/metaData.html)
↔ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>?

Any additional metadata related to the cached user action.
getter/setter pair

[operation](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserAction/operation.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

The operation to be performed for the cached user action.
getter/setter pair

[operationType](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserAction/operationType.html)
↔ dynamic

The type of operation for the cached user action.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited

[status](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserAction/status.html)
↔ dynamic

The status of the cached user action.
getter/setter pair

[timeStamp](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserAction/timeStamp.html)
↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)

The timestamp when the action was cached.
getter/setter pair

[variables](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserAction/variables.html)
↔ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>?

The variables required for the operation, if any.
getter/setter pair



## Methods

[execute](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserAction/execute.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


Executes the cached user action based on its operation type.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toJson](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserAction/toJson.html)()
→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>


Converts a CachedUserAction to a JSON-compatible map.

[toString](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserAction/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
override



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [cached\_user\_action](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/)
3. CachedUserAction class

##### cached\_user\_action library





talawa
1.0.0+1






