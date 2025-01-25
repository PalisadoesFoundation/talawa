




read method - CachedOperationTypeAdapter class - enums library - Dart API







menu

1. [talawa](../../index.html)
2. [enums/enums.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/)
3. [CachedOperationTypeAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/CachedOperationTypeAdapter-class.html)
4. read method

read


dark\_mode

light\_mode




# read method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[CachedOperationType](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/CachedOperationType.html)
read(

1. dynamic reader

)

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
2. [enums](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/)
3. [CachedOperationTypeAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/CachedOperationTypeAdapter-class.html)
4. read method

##### CachedOperationTypeAdapter class





talawa
1.0.0+1






