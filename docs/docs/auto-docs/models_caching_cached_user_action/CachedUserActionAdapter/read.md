
<div>

# read method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)]
read(

1.  [[[BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html)]
    reader]

)


override




Is called when a value has to be decoded.



## Implementation

``` language-dart
@override
CachedUserAction read(BinaryReader reader) {
  final numOfFields = reader.;
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.: reader.,
  };
  return CachedUserAction(
    id: fields[0] as String,
    operation: fields[1] as String,
    variables: (fields[2] as Map?)?.cast<String, dynamic>(),
    timeStamp: fields[3] as DateTime,
    status: fields[4] as CachedUserActionStatus,
    metaData: (fields[5] as Map?)?.cast<String, dynamic>(),
    operationType: fields[6] as CachedOperationType,
    expiry: fields[7] as DateTime,
  );
}
```







1.  [talawa](../../index.html)
2.  [cached_user_action](../../models_caching_cached_user_action/)
3.  [CachedUserActionAdapter](../../models_caching_cached_user_action/CachedUserActionAdapter-class.html)
4.  read method

##### CachedUserActionAdapter class







