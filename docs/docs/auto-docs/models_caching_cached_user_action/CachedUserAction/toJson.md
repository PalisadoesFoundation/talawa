
<div>

# toJson method

</div>


[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
dynamic\>]]




Converts a CachedUserAction to a JSON-compatible map.

**params**: None

**returns**:

-   `Map<String, dynamic>`: a map representing the CachedUserAction.



## Implementation

``` language-dart
Map<String, dynamic>  {
  return {
    'id': id,
    'operation': operation,
    'variables': variables,
    'timeStamp': timeStamp.,
    'status': status,
    'metaData': metaData,
    'operationType': operationType,
    'expiry': expiry.,
  };
}
```







1.  [talawa](../../index.html)
2.  [cached_user_action](../../models_caching_cached_user_action/)
3.  [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4.  toJson method

##### CachedUserAction class







