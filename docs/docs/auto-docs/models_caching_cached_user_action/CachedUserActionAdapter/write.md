
<div>

# write method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

void write(

1.  [[[BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html)]
    writer, ]
2.  [[[CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)]
    obj]

)


override




Is called when a value has to be encoded.



## Implementation

``` language-dart
@override
void write(BinaryWriter writer, CachedUserAction obj) {
  writer
    ..writeByte(8)
    ..writeByte(0)
    ..write(obj.id)
    ..writeByte(1)
    ..write(obj.operation)
    ..writeByte(2)
    ..write(obj.variables)
    ..writeByte(3)
    ..write(obj.timeStamp)
    ..writeByte(4)
    ..write(obj.status)
    ..writeByte(5)
    ..write(obj.metaData)
    ..writeByte(6)
    ..write(obj.operationType)
    ..writeByte(7)
    ..write(obj.expiry);
}
```







1.  [talawa](../../index.html)
2.  [cached_user_action](../../models_caching_cached_user_action/)
3.  [CachedUserActionAdapter](../../models_caching_cached_user_action/CachedUserActionAdapter-class.html)
4.  write method

##### CachedUserActionAdapter class







