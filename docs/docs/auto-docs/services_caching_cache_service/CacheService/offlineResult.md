



menu

1.  [talawa](../../index.md)
2.  [services/caching/cache_service.dart](../../services_caching_cache_service/)
3.  [CacheService](../../services_caching_cache_service/CacheService-class.md)
4.  offlineResult property


offlineResult


 dark_mode   light_mode 




<div>

# offlineResult property

</div>


[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]
offlineResult


final




static graphql result when device is offline.



## Implementation

``` language-dart
static final QueryResult offlineResult = QueryResult(
  options: QueryOptions(
    document: gql(.),
  ),
  data: ,
  source: QueryResultSource.cache,
);
```







1.  [talawa](../../index.md)
2.  [cache_service](../../services_caching_cache_service/)
3.  [CacheService](../../services_caching_cache_service/CacheService-class.md)
4.  offlineResult property

##### CacheService class









 talawa 1.0.0+1 
