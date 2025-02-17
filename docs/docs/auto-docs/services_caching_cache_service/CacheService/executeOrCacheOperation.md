
<div>

# executeOrCacheOperation method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
executeOrCacheOperation({

1.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    operation,
    ]
2.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]?]
    variables,
    ]
3.  [required
    [[CachedOperationType](../../enums_enums/CachedOperationType.md)]
    operationType,
    ]
4.  [required
    [[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
    ,
    ]

})



Executes a GraphQL operation or caches it for offline execution.

This function checks internet connectivity. If online, it executes the
provided `whenOnline` function and returns the result. If offline, it
creates a `CachedUserAction` object representing the operation and
stores it in the `offlineActionQueue`. It then returns null.

**params**:

-   `operation`: The GraphQL operation string.
-   `variables`: Optional variables for the operation (Map\<String,
    dynamic\>).
-   `operationType`: The type of the GraphQL operation (from
    `CachedOperationType` enum).
-   `whenOnline`: A function that executes the operation online and
    returns the result (Future\<QueryResult\<Object?\>?\>).

**returns**:

-   `Future<QueryResult<Object?>>`: Returns the result of the operation.



## Implementation

``` language-dart
Future<QueryResult<Object?>> executeOrCacheOperation({
  required String operation,
  Map<String, dynamic>? variables,
  required CachedOperationType operationType,
  required Future<QueryResult<Object?>>  whenOnline,
}) async {
  if (AppConnectivity.isOnline) {
    final result = await ;
    return result;
  } else {
    // Create a CachedUserAction for offline execution
    final timeStamp = DateTime.;
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







1.  [talawa](../../index.md)
2.  [cache_service](../../services_caching_cache_service/)
3.  [CacheService](../../services_caching_cache_service/CacheService-class.md)
4.  executeOrCacheOperation method

##### CacheService class







