




write method - CachedUserActionStatusAdapter class - enums library - Dart API







menu

1. [talawa](../../index.html)
2. [enums/enums.dart](../../enums_enums/enums_enums-library.html)
3. [CachedUserActionStatusAdapter](../../enums_enums/CachedUserActionStatusAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @override

void
write(

1. [BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html) writer,
2. [CachedUserActionStatus](../../enums_enums/CachedUserActionStatus.html) obj

)
override

Is called when a value has to be encoded.


## Implementation

```
@override
void write(BinaryWriter writer, CachedUserActionStatus obj) {
  switch (obj) {
    case CachedUserActionStatus.pending:
      writer.writeByte(0);
      break;
    case CachedUserActionStatus.completed:
      writer.writeByte(1);
      break;
  }
}
```

 


1. [talawa](../../index.html)
2. [enums](../../enums_enums/enums_enums-library.html)
3. [CachedUserActionStatusAdapter](../../enums_enums/CachedUserActionStatusAdapter-class.html)
4. write method

##### CachedUserActionStatusAdapter class





talawa
1.0.0+1






