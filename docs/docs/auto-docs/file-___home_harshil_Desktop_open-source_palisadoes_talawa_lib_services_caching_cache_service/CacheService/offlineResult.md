




offlineResult property - CacheService class - cache\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/caching/cache\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_cache_service/)
3. [CacheService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_cache_service/CacheService-class.html)
4. offlineResult property

offlineResult


dark\_mode

light\_mode




# offlineResult property


dynamic
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
2. [cache\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_cache_service/)
3. [CacheService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_cache_service/CacheService-class.html)
4. offlineResult property

##### CacheService class





talawa
1.0.0+1






