
<div>

# offlineResult property

</div>


[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]
offlineResult


final




static graphql result when device is offline.



## Implementation

``` language-dart
static final QueryResult offlineResult = QueryResult(
  options: QueryOptions(
    document: gql(.),
  ),
  data: {
    'cached': true,
  },
  source: QueryResultSource.cache,
);
```







1.  [talawa](../../index.html)
2.  [cache_service](../../services_caching_cache_service/)
3.  [CacheService](../../services_caching_cache_service/CacheService-class.html)
4.  offlineResult property

##### CacheService class







