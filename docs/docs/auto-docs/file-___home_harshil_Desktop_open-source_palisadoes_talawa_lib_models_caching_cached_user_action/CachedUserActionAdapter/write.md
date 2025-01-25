




write method - CachedUserActionAdapter class - cached\_user\_action library - Dart API







menu

1. [talawa](../../index.html)
2. [models/caching/cached\_user\_action.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/)
3. [CachedUserActionAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserActionAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void
write(

1. dynamic writer,
2. [CachedUserAction](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserAction-class.html) obj

)

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [cached\_user\_action](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/)
3. [CachedUserActionAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_caching_cached_user_action/CachedUserActionAdapter-class.html)
4. write method

##### CachedUserActionAdapter class





talawa
1.0.0+1






