




write method - CachedOperationTypeAdapter class - enums library - Dart API







menu

1. [talawa](../../index.html)
2. [enums/enums.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/)
3. [CachedOperationTypeAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/CachedOperationTypeAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void
write(

1. dynamic writer,
2. [CachedOperationType](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/CachedOperationType.html) obj

)

## Implementation

```
@override
void write(BinaryWriter writer, CachedOperationType obj) {
  switch (obj) {
    case CachedOperationType.gqlAuthQuery:
      writer.writeByte(0);
      break;
    case CachedOperationType.gqlAuthMutation:
      writer.writeByte(1);
      break;
    case CachedOperationType.gqlNonAuthQuery:
      writer.writeByte(2);
      break;
    case CachedOperationType.gqlNonAuthMutation:
      writer.writeByte(3);
      break;
  }
}
```

 


1. [talawa](../../index.html)
2. [enums](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/)
3. [CachedOperationTypeAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/CachedOperationTypeAdapter-class.html)
4. write method

##### CachedOperationTypeAdapter class





talawa
1.0.0+1






