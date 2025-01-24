




read method - CachedOperationTypeAdapter class - enums library - Dart API







menu

1. [talawa](../../index.html)
2. [enums/enums.dart](../../enums_enums/enums_enums-library.html)
3. [CachedOperationTypeAdapter](../../enums_enums/CachedOperationTypeAdapter-class.html)
4. read method

read


dark\_mode

light\_mode




# read method


1. @override

[CachedOperationType](../../enums_enums/CachedOperationType.html)
read(

1. [BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html) reader

)
override

Is called when a value has to be decoded.


## Implementation

```
@override
CachedOperationType read(BinaryReader reader) {
  switch (reader.readByte()) {
    case 0:
      return CachedOperationType.gqlAuthQuery;
    case 1:
      return CachedOperationType.gqlAuthMutation;
    case 2:
      return CachedOperationType.gqlNonAuthQuery;
    case 3:
      return CachedOperationType.gqlNonAuthMutation;
    default:
      return CachedOperationType.gqlAuthQuery;
  }
}
```

 


1. [talawa](../../index.html)
2. [enums](../../enums_enums/enums_enums-library.html)
3. [CachedOperationTypeAdapter](../../enums_enums/CachedOperationTypeAdapter-class.html)
4. read method

##### CachedOperationTypeAdapter class





talawa
1.0.0+1






