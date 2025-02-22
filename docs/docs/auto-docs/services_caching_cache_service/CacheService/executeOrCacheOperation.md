
<div>

# executeOrCacheOperation method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]




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
Future<QueryResult<Object?>>  async 
```







1.  [talawa](../../index.md)
2.  [cache_service](../../services_caching_cache_service/)
3.  [CacheService](../../services_caching_cache_service/CacheService-class.md)
4.  executeOrCacheOperation method

##### CacheService class







