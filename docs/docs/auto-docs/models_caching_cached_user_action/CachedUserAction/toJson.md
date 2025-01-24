




toJson method - CachedUserAction class - cached\_user\_action library - Dart API







menu

1. [talawa](../../index.html)
2. [models/caching/cached\_user\_action.dart](../../models_caching_cached_user_action/models_caching_cached_user_action-library.html)
3. [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4. toJson method

toJson


dark\_mode

light\_mode




# toJson method


Map<String, dynamic>
toJson()

Converts a CachedUserAction to a JSON-compatible map.

**params**:
None

**returns**:

* `Map<String, dynamic>`: a map representing the CachedUserAction.

## Implementation

```
Map<String, dynamic> toJson() {
  return {
    'id': id,
    'operation': operation,
    'variables': variables,
    'timeStamp': timeStamp.toIso8601String(),
    'status': status,
    'metaData': metaData,
    'operationType': operationType,
    'expiry': expiry.toIso8601String(),
  };
}
```

 


1. [talawa](../../index.html)
2. [cached\_user\_action](../../models_caching_cached_user_action/models_caching_cached_user_action-library.html)
3. [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4. toJson method

##### CachedUserAction class





talawa
1.0.0+1






