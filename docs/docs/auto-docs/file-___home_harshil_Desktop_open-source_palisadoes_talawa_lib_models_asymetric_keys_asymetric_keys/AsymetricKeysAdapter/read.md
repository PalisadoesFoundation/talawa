




read method - AsymetricKeysAdapter class - asymetric\_keys library - Dart API







menu

1. [talawa](../../index.html)
2. [models/asymetric\_keys/asymetric\_keys.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_asymetric_keys_asymetric_keys/)
3. [AsymetricKeysAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_asymetric_keys_asymetric_keys/AsymetricKeysAdapter-class.html)
4. read method

read


dark\_mode

light\_mode




# read method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[AsymetricKeys](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_asymetric_keys_asymetric_keys/AsymetricKeys-class.html)
read(

1. dynamic reader

)

## Implementation

```
@override
AsymetricKeys read(BinaryReader reader) {
  final numOfFields = reader.readByte();
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
  };
  return AsymetricKeys(
    keyPair: fields[0] as AsymmetricKeyPair<PublicKey, PrivateKey>,
  );
}
```

 


1. [talawa](../../index.html)
2. [asymetric\_keys](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_asymetric_keys_asymetric_keys/)
3. [AsymetricKeysAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_asymetric_keys_asymetric_keys/AsymetricKeysAdapter-class.html)
4. read method

##### AsymetricKeysAdapter class





talawa
1.0.0+1






