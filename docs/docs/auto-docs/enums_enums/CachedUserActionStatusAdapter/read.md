




read method - CachedUserActionStatusAdapter class - enums library - Dart API







menu

1. [talawa](../../index.html)
2. [enums/enums.dart](../../enums_enums/enums_enums-library.html)
3. [CachedUserActionStatusAdapter](../../enums_enums/CachedUserActionStatusAdapter-class.html)
4. read method

read


dark\_mode

light\_mode




# read method


1. @override

[CachedUserActionStatus](../../enums_enums/CachedUserActionStatus.html)
read(

1. [BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html) reader

)
override

Is called when a value has to be decoded.


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
2. [enums](../../enums_enums/enums_enums-library.html)
3. [CachedUserActionStatusAdapter](../../enums_enums/CachedUserActionStatusAdapter-class.html)
4. read method

##### CachedUserActionStatusAdapter class





talawa
1.0.0+1






