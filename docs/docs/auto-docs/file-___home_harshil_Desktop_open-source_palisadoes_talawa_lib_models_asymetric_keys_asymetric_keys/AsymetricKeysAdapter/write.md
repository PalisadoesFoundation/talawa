




write method - AsymetricKeysAdapter class - asymetric\_keys library - Dart API







menu

1. [talawa](../../index.html)
2. [models/asymetric\_keys/asymetric\_keys.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_asymetric_keys_asymetric_keys/)
3. [AsymetricKeysAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_asymetric_keys_asymetric_keys/AsymetricKeysAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void
write(

1. dynamic writer,
2. [AsymetricKeys](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_asymetric_keys_asymetric_keys/AsymetricKeys-class.html) obj

)

## Implementation

```
@override
void write(BinaryWriter writer, AsymetricKeys obj) {
  writer
    ..writeByte(1)
    ..writeByte(0)
    ..write(obj.keyPair);
}
```

 


1. [talawa](../../index.html)
2. [asymetric\_keys](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_asymetric_keys_asymetric_keys/)
3. [AsymetricKeysAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_asymetric_keys_asymetric_keys/AsymetricKeysAdapter-class.html)
4. write method

##### AsymetricKeysAdapter class





talawa
1.0.0+1






