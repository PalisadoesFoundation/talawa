
<div>

# CachedUserAction class

</div>


CachedUserAction class represents a user action that is cached for
offline use.

This class provides the following functionalities:

-   `toJson` : converts a CachedUserAction to a JSON-compatible map.
-   `fromJson` : creates a CachedUserAction from a JSON-compatible map.
-   `execute` : executes the cached user action based on its operation
    type.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [HiveObject](https://pub.dev/documentation/hive/2.2.3/hive/HiveObject-class.html)
    -   CachedUserAction

Annotations

:   -   @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId:
        3)



## Constructors

[[CachedUserAction](../models_caching_cached_user_action/CachedUserAction/CachedUserAction.md)][({[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] id, ][required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] operation, ][[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]?] variables, ][required [[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)] timeStamp, ][required [[CachedUserActionStatus](../enums_enums/CachedUserActionStatus.md)] status, ][[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]?] metaData, ][required [[CachedOperationType](../enums_enums/CachedOperationType.md)] operationType, ][required [[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)] expiry]})]

:   

[[CachedUserAction.fromJson](../models_caching_cached_user_action/CachedUserAction/CachedUserAction.fromJson.md)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] json])]
:   Creates a CachedUserAction from a JSON-compatible map.
    ::: 
    factory
    :::



## Properties

[[box](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/box.html)] [→ [BoxBase](https://pub.dev/documentation/hive/2.2.3/hive/BoxBase-class.html)?]
:   Get the box in which this object is stored. Returns `null` if object
    has not been added to a box yet.
    ::: features
    no setterinherited
    :::

[[expiry](../models_caching_cached_user_action/CachedUserAction/expiry.md)] [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]
:   The expiry date and time for the cached user action.
    ::: features
    getter/setter pair
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[id](../models_caching_cached_user_action/CachedUserAction/id.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   The unique identifier for the cached user action.
    ::: features
    getter/setter pair
    :::

[[isInBox](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/isInBox.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Returns whether this object is currently stored in a box.
    ::: features
    no setterinherited
    :::

[[key](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/key.html)] → dynamic
:   Get the key associated with this object. Returns `null` if object
    has not been added to a box yet.
    ::: features
    no setterinherited
    :::

[[metaData](../models_caching_cached_user_action/CachedUserAction/metaData.md)] [↔ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]?]
:   Any additional metadata related to the cached user action.
    ::: features
    getter/setter pair
    :::

[[operation](../models_caching_cached_user_action/CachedUserAction/operation.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   The operation to be performed for the cached user action.
    ::: features
    getter/setter pair
    :::

[[operationType](../models_caching_cached_user_action/CachedUserAction/operationType.md)] [↔ [CachedOperationType](../enums_enums/CachedOperationType.md)]
:   The type of operation for the cached user action.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[status](../models_caching_cached_user_action/CachedUserAction/status.md)] [↔ [CachedUserActionStatus](../enums_enums/CachedUserActionStatus.md)]
:   The status of the cached user action.
    ::: features
    getter/setter pair
    :::

[[timeStamp](../models_caching_cached_user_action/CachedUserAction/timeStamp.md)] [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]
:   The timestamp when the action was cached.
    ::: features
    getter/setter pair
    :::

[[variables](../models_caching_cached_user_action/CachedUserAction/variables.md)] [↔ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]?]
:   The variables required for the operation, if any.
    ::: features
    getter/setter pair
    :::



## Methods

[[delete](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/delete.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Deletes this object from the box it is stored in.
    ::: features
    inherited
    :::

[[execute](../models_caching_cached_user_action/CachedUserAction/execute.md)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]] ]
:   Executes the cached user action based on its operation type.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[save](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/save.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Persists this object.
    ::: features
    inherited
    :::

[[toJson](../models_caching_cached_user_action/CachedUserAction/toJson.md)][() [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] ]
:   Converts a CachedUserAction to a JSON-compatible map.

[[toString](../models_caching_cached_user_action/CachedUserAction/toString.md)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    override
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [cached_user_action](../models_caching_cached_user_action/)
3.  CachedUserAction class

##### cached_user_action library







