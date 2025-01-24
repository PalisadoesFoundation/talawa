




read method - CachedUserActionAdapter class - cached\_user\_action library - Dart API







menu

1. [talawa](../../index.html)
2. [models/caching/cached\_user\_action.dart](../../models_caching_cached_user_action/models_caching_cached_user_action-library.html)
3. [CachedUserActionAdapter](../../models_caching_cached_user_action/CachedUserActionAdapter-class.html)
4. read method

read


dark\_mode

light\_mode




# read method


1. @override

[CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
read(

1. [BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html) reader

)
override

Is called when a value has to be decoded.


## Implementation

```
@override
CachedUserAction read(BinaryReader reader) {
  final numOfFields = reader.readByte();
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
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

 


1. [talawa](../../index.html)
2. [cached\_user\_action](../../models_caching_cached_user_action/models_caching_cached_user_action-library.html)
3. [CachedUserActionAdapter](../../models_caching_cached_user_action/CachedUserActionAdapter-class.html)
4. read method

##### CachedUserActionAdapter class





talawa
1.0.0+1






