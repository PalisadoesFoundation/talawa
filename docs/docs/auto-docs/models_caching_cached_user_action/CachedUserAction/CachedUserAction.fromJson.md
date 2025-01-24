




CachedUserAction.fromJson constructor - CachedUserAction - cached\_user\_action library - Dart API







menu

1. [talawa](../../index.html)
2. [models/caching/cached\_user\_action.dart](../../models_caching_cached_user_action/models_caching_cached_user_action-library.html)
3. [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4. CachedUserAction.fromJson factory constructor

CachedUserAction.fromJson


dark\_mode

light\_mode




# CachedUserAction.fromJson constructor


CachedUserAction.fromJson(

1. Map<String, dynamic> json

)

Creates a CachedUserAction from a JSON-compatible map.

**params**:

* `json` : a map representing the CachedUserAction.

**returns**:

* `CachedUserAction` : a new instance of CachedUserAction.

## Implementation

```
factory CachedUserAction.fromJson(Map<String, dynamic> json) {
  return CachedUserAction(
    id: json['id'] as String,
    operation: json['operation'] as String,
    variables: json['variables'] as Map<String, dynamic>?,
    timeStamp: DateTime.parse(json['timeStamp'] as String),
    status: json['status'] as CachedUserActionStatus,
    expiry: DateTime.parse(json['expiry'] as String),
    metaData: json['metaData'] as Map<String, dynamic>?,
    operationType: json['operationType'] as CachedOperationType,
  );
}
```

 


1. [talawa](../../index.html)
2. [cached\_user\_action](../../models_caching_cached_user_action/models_caching_cached_user_action-library.html)
3. [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4. CachedUserAction.fromJson factory constructor

##### CachedUserAction class





talawa
1.0.0+1






