




executeOrCacheOperation method - CacheService class - cache\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/caching/cache\_service.dart](../../services_caching_cache_service/services_caching_cache_service-library.html)
3. [CacheService](../../services_caching_cache_service/CacheService-class.html)
4. executeOrCacheOperation method

executeOrCacheOperation


dark\_mode

light\_mode




# executeOrCacheOperation method


Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>
executeOrCacheOperation({

1. required String operation,
2. Map<String, dynamic>? variables,
3. required [CachedOperationType](../../enums_enums/CachedOperationType.html) operationType,
4. required Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>> whenOnline(),

})

Executes a GraphQL operation or caches it for offline execution.

This function checks internet connectivity. If online, it executes the
provided `whenOnline` function and returns the result. If offline, it creates
a `CachedUserAction` object representing the operation and stores it
in the `offlineActionQueue`. It then returns null.

**params**:

* `operation`: The GraphQL operation string.
* `variables`: Optional variables for the operation (Map<String, dynamic>).
* `operationType`: The type of the GraphQL operation (from `CachedOperationType` enum).
* `whenOnline`: A function that executes the operation online and returns the result (Future<QueryResult<Object?>?>).

**returns**:

* `Future<QueryResult<Object?>>`: Returns the result of the operation.

## Implementation

```
Future<QueryResult<Object?>> executeOrCacheOperation({
  required String operation,
  Map<String, dynamic>? variables,
  required CachedOperationType operationType,
  required Future<QueryResult<Object?>> Function() whenOnline,
}) async {
  if (AppConnectivity.isOnline) {
    final result = await whenOnline();
    return result;
  } else {
    // Create a CachedUserAction for offline execution
    final timeStamp = DateTime.now();
    final expiry = timeStamp.add(_timeToLive);
    final cachedAction = CachedUserAction(
      id: 'PlaceHolder', // Placeholder for actual ID generation
      operation: operation,
      variables: variables,
      operationType: operationType,
      status: CachedUserActionStatus.pending,
      timeStamp: timeStamp,
      expiry: expiry,
    );
    await offlineActionQueue.addAction(cachedAction);
    debugPrint('cached');
    return offlineResult;
  }
}
```

 


1. [talawa](../../index.html)
2. [cache\_service](../../services_caching_cache_service/services_caching_cache_service-library.html)
3. [CacheService](../../services_caching_cache_service/CacheService-class.html)
4. executeOrCacheOperation method

##### CacheService class





talawa
1.0.0+1






