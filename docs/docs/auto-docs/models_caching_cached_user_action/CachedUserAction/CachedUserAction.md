




CachedUserAction constructor - CachedUserAction - cached\_user\_action library - Dart API







menu

1. [talawa](../../index.html)
2. [models/caching/cached\_user\_action.dart](../../models_caching_cached_user_action/models_caching_cached_user_action-library.html)
3. [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4. CachedUserAction constructor

CachedUserAction


dark\_mode

light\_mode




# CachedUserAction constructor


CachedUserAction({

1. required String id,
2. required String operation,
3. Map<String, dynamic>? variables,
4. required DateTime timeStamp,
5. required [CachedUserActionStatus](../../enums_enums/CachedUserActionStatus.html) status,
6. Map<String, dynamic>? metaData,
7. required [CachedOperationType](../../enums_enums/CachedOperationType.html) operationType,
8. required DateTime expiry,

})

## Implementation

```
CachedUserAction({
  required this.id,
  required this.operation,
  this.variables,
  required this.timeStamp,
  required this.status,
  this.metaData,
  required this.operationType,
  required this.expiry,
});
```

 


1. [talawa](../../index.html)
2. [cached\_user\_action](../../models_caching_cached_user_action/models_caching_cached_user_action-library.html)
3. [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4. CachedUserAction constructor

##### CachedUserAction class





talawa
1.0.0+1






