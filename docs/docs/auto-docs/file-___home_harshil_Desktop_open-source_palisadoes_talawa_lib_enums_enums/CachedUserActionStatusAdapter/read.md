




read method - CachedUserActionStatusAdapter class - enums library - Dart API







menu

1. [talawa](../../index.html)
2. [enums/enums.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/)
3. [CachedUserActionStatusAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/CachedUserActionStatusAdapter-class.html)
4. read method

read


dark\_mode

light\_mode




# read method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[CachedUserActionStatus](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/CachedUserActionStatus.html)
read(

1. dynamic reader

)

## Implementation

```
@override
CachedUserActionStatus read(BinaryReader reader) {
  switch (reader.readByte()) {
    case 0:
      return CachedUserActionStatus.pending;
    case 1:
      return CachedUserActionStatus.completed;
    default:
      return CachedUserActionStatus.pending;
  }
}
```

 


1. [talawa](../../index.html)
2. [enums](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/)
3. [CachedUserActionStatusAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/CachedUserActionStatusAdapter-class.html)
4. read method

##### CachedUserActionStatusAdapter class





talawa
1.0.0+1






