




CacheService class - cache\_service library - Dart API







menu

1. [talawa](../index.html)
2. [services/caching/cache\_service.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_cache_service/)
3. CacheService class

CacheService


dark\_mode

light\_mode




# CacheService class


Service to handle caching routines.


## Constructors

[CacheService](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_cache_service/CacheService/CacheService.html)()

Initializes the cache service and the offline action queue.



## Properties

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[offlineActionQueue](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_cache_service/CacheService/offlineActionQueue.html)
↔ dynamic

Queue for storing user actions to be executed offline.
latefinal

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited



## Methods

[executeOrCacheOperation](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_cache_service/CacheService/executeOrCacheOperation.html)({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) operation, [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>? variables, required dynamic operationType, required [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html) whenOnline()})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


Executes a GraphQL operation or caches it for offline execution.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



## Static Properties

[offlineResult](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_cache_service/CacheService/offlineResult.html)
→ dynamic

static graphql result when device is offline.
final



 


1. [talawa](../index.html)
2. [cache\_service](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_cache_service/)
3. CacheService class

##### cache\_service library





talawa
1.0.0+1






