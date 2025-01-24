




CachedUserAction class - cached\_user\_action library - Dart API







menu

1. [talawa](../index.html)
2. [models/caching/cached\_user\_action.dart](../models_caching_cached_user_action/models_caching_cached_user_action-library.html)
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

Inheritance

* Object
* [HiveObject](https://pub.dev/documentation/hive/2.2.3/hive/HiveObject-class.html)
* CachedUserAction

Annotations

* @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId: 3)



## Constructors

[CachedUserAction](../models_caching_cached_user_action/CachedUserAction/CachedUserAction.html)({required String id, required String operation, Map<String, dynamic>? variables, required DateTime timeStamp, required [CachedUserActionStatus](../enums_enums/CachedUserActionStatus.html) status, Map<String, dynamic>? metaData, required [CachedOperationType](../enums_enums/CachedOperationType.html) operationType, required DateTime expiry})


[CachedUserAction.fromJson](../models_caching_cached_user_action/CachedUserAction/CachedUserAction.fromJson.html)(Map<String, dynamic> json)

Creates a CachedUserAction from a JSON-compatible map.
factory



## Properties

[box](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/box.html)
→ [BoxBase](https://pub.dev/documentation/hive/2.2.3/hive/BoxBase-class.html)?

Get the box in which this object is stored. Returns `null` if object has
not been added to a box yet.
no setterinherited

[expiry](../models_caching_cached_user_action/CachedUserAction/expiry.html)
↔ DateTime

The expiry date and time for the cached user action.
getter/setter pair

[hashCode](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[id](../models_caching_cached_user_action/CachedUserAction/id.html)
↔ String

The unique identifier for the cached user action.
getter/setter pair

[isInBox](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/isInBox.html)
→ bool

Returns whether this object is currently stored in a box.
no setterinherited

[key](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/key.html)
→ dynamic

Get the key associated with this object. Returns `null` if object has
not been added to a box yet.
no setterinherited

[metaData](../models_caching_cached_user_action/CachedUserAction/metaData.html)
↔ Map<String, dynamic>?

Any additional metadata related to the cached user action.
getter/setter pair

[operation](../models_caching_cached_user_action/CachedUserAction/operation.html)
↔ String

The operation to be performed for the cached user action.
getter/setter pair

[operationType](../models_caching_cached_user_action/CachedUserAction/operationType.html)
↔ [CachedOperationType](../enums_enums/CachedOperationType.html)

The type of operation for the cached user action.
getter/setter pair

[runtimeType](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[status](../models_caching_cached_user_action/CachedUserAction/status.html)
↔ [CachedUserActionStatus](../enums_enums/CachedUserActionStatus.html)

The status of the cached user action.
getter/setter pair

[timeStamp](../models_caching_cached_user_action/CachedUserAction/timeStamp.html)
↔ DateTime

The timestamp when the action was cached.
getter/setter pair

[variables](../models_caching_cached_user_action/CachedUserAction/variables.html)
↔ Map<String, dynamic>?

The variables required for the operation, if any.
getter/setter pair



## Methods

[delete](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/delete.html)()
→ Future<void>


Deletes this object from the box it is stored in.
inherited

[execute](../models_caching_cached_user_action/CachedUserAction/execute.html)()
→ Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>


Executes the cached user action based on its operation type.

[noSuchMethod](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[save](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/save.html)()
→ Future<void>


Persists this object.
inherited

[toJson](../models_caching_cached_user_action/CachedUserAction/toJson.html)()
→ Map<String, dynamic>


Converts a CachedUserAction to a JSON-compatible map.

[toString](../models_caching_cached_user_action/CachedUserAction/toString.html)()
→ String


A string representation of this object.



## Operators

[operator ==](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [cached\_user\_action](../models_caching_cached_user_action/models_caching_cached_user_action-library.html)
3. CachedUserAction class

##### cached\_user\_action library





talawa
1.0.0+1






