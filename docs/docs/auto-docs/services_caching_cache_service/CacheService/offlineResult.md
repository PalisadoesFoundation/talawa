




offlineResult property - CacheService class - cache\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/caching/cache\_service.dart](../../services_caching_cache_service/services_caching_cache_service-library.html)
3. [CacheService](../../services_caching_cache_service/CacheService-class.html)
4. offlineResult property

offlineResult


dark\_mode

light\_mode




# offlineResult property


[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>
offlineResult
final

static graphql result when device is offline.


## Implementation

```
static final QueryResult offlineResult = QueryResult(
  options: QueryOptions(
    document: gql(PostQueries().addLike()),
  ),
  data: {
    'cached': true,
  },
  source: QueryResultSource.cache,
);
```

 


1. [talawa](../../index.html)
2. [cache\_service](../../services_caching_cache_service/services_caching_cache_service-library.html)
3. [CacheService](../../services_caching_cache_service/CacheService-class.html)
4. offlineResult property

##### CacheService class





talawa
1.0.0+1






