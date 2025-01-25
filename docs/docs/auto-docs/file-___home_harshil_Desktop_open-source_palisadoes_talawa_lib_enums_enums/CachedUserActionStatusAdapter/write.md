




write method - CachedUserActionStatusAdapter class - enums library - Dart API







menu

1. [talawa](../../index.html)
2. [enums/enums.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/)
3. [CachedUserActionStatusAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/CachedUserActionStatusAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void
write(

1. dynamic writer,
2. [CachedUserActionStatus](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/CachedUserActionStatus.html) obj

)

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
2. [enums](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/)
3. [CachedUserActionStatusAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_enums_enums/CachedUserActionStatusAdapter-class.html)
4. write method

##### CachedUserActionStatusAdapter class





talawa
1.0.0+1






