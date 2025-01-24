




write method - CachedOperationTypeAdapter class - enums library - Dart API







menu

1. [talawa](../../index.html)
2. [enums/enums.dart](../../enums_enums/enums_enums-library.html)
3. [CachedOperationTypeAdapter](../../enums_enums/CachedOperationTypeAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @override

void
write(

1. [BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html) writer,
2. [CachedOperationType](../../enums_enums/CachedOperationType.html) obj

)
override

Is called when a value has to be encoded.


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
2. [enums](../../enums_enums/enums_enums-library.html)
3. [CachedOperationTypeAdapter](../../enums_enums/CachedOperationTypeAdapter-class.html)
4. write method

##### CachedOperationTypeAdapter class





talawa
1.0.0+1






