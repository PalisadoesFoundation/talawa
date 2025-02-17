
<div>

# CachedUserAction constructor

</div>


CachedUserAction({

1.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    id, ]
2.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    operation, ]
3.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]?]
    variables, ]
4.  [required
    [[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]
    timeStamp, ]
5.  [required
    [[CachedUserActionStatus](../../enums_enums/CachedUserActionStatus.md)]
    status, ]
6.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]?]
    metaData, ]
7.  [required
    [[CachedOperationType](../../enums_enums/CachedOperationType.md)]
    operationType, ]
8.  [required
    [[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]
    expiry, ]

})



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [cached_user_action](../../models_caching_cached_user_action/)
3.  [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.md)
4.  CachedUserAction constructor

##### CachedUserAction class







