




CacheService class - cache\_service library - Dart API







menu

1. [talawa](../index.html)
2. [services/caching/cache\_service.dart](../services_caching_cache_service/services_caching_cache_service-library.html)
3. CacheService class

CacheService


dark\_mode

light\_mode




# CacheService class


Service to handle caching routines.


## Constructors

[CacheService](../services_caching_cache_service/CacheService/CacheService.html)()

Initializes the cache service and the offline action queue.



## Properties

[hashCode](../services_caching_cache_service/CacheService/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[offlineActionQueue](../services_caching_cache_service/CacheService/offlineActionQueue.html)
↔ [OfflineActionQueue](../services_caching_offline_action_queue/OfflineActionQueue-class.html)

Queue for storing user actions to be executed offline.
latefinal

[runtimeType](../services_caching_cache_service/CacheService/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[executeOrCacheOperation](../services_caching_cache_service/CacheService/executeOrCacheOperation.html)({required String operation, Map<String, dynamic>? variables, required [CachedOperationType](../enums_enums/CachedOperationType.html) operationType, required Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>> whenOnline()})
→ Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>


Executes a GraphQL operation or caches it for offline execution.

[noSuchMethod](../services_caching_cache_service/CacheService/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toString](../services_caching_cache_service/CacheService/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](../services_caching_cache_service/CacheService/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



## Static Properties

[offlineResult](../services_caching_cache_service/CacheService/offlineResult.html)
→ [QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>

static graphql result when device is offline.
final



 


1. [talawa](../index.html)
2. [cache\_service](../services_caching_cache_service/services_caching_cache_service-library.html)
3. CacheService class

##### cache\_service library





talawa
1.0.0+1






