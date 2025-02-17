::::::: {#dartdoc-main-content .main-content above-sidebar="services_caching_cache_service/CacheService-class-sidebar.html" below-sidebar=""}
<div>

# [executeOrCacheOperation]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[executeOrCacheOperation]{.name}({

1.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [operation]{.parameter-name},
    ]{#executeOrCacheOperation-param-operation .parameter}
2.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}?]{.type-annotation}
    [variables]{.parameter-name},
    ]{#executeOrCacheOperation-param-variables .parameter}
3.  [required
    [[CachedOperationType](../../enums_enums/CachedOperationType.html)]{.type-annotation}
    [operationType]{.parameter-name},
    ]{#executeOrCacheOperation-param-operationType .parameter}
4.  [required
    [[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.type-annotation}
    [whenOnline]{.parameter-name}(),
    ]{#executeOrCacheOperation-param-whenOnline .parameter}

})
:::

::: {.section .desc .markdown}
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
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [cache_service](../../services_caching_cache_service/)
3.  [CacheService](../../services_caching_cache_service/CacheService-class.html)
4.  executeOrCacheOperation method

##### CacheService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
