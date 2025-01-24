




write method - AsymetricKeysAdapter class - asymetric\_keys library - Dart API







menu

1. [talawa](../../index.html)
2. [models/asymetric\_keys/asymetric\_keys.dart](../../models_asymetric_keys_asymetric_keys/models_asymetric_keys_asymetric_keys-library.html)
3. [AsymetricKeysAdapter](../../models_asymetric_keys_asymetric_keys/AsymetricKeysAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @override

void
write(

1. [BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html) writer,
2. [AsymetricKeys](../../models_asymetric_keys_asymetric_keys/AsymetricKeys-class.html) obj

)
override

Is called when a value has to be encoded.


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
2. [asymetric\_keys](../../models_asymetric_keys_asymetric_keys/models_asymetric_keys_asymetric_keys-library.html)
3. [AsymetricKeysAdapter](../../models_asymetric_keys_asymetric_keys/AsymetricKeysAdapter-class.html)
4. write method

##### AsymetricKeysAdapter class





talawa
1.0.0+1






