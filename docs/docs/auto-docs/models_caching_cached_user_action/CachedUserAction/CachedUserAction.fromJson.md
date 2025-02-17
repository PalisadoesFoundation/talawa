
<div>

# CachedUserAction.fromJson constructor

</div>


CachedUserAction.fromJson(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    json]

)



Creates a CachedUserAction from a JSON-compatible map.

**params**:

-   `json` : a map representing the CachedUserAction.

**returns**:

-   `CachedUserAction` : a new instance of CachedUserAction.



## Implementation

``` language-dart
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







1.  [talawa](../../index.html)
2.  [cached_user_action](../../models_caching_cached_user_action/)
3.  [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4.  CachedUserAction.fromJson factory constructor

##### CachedUserAction class







