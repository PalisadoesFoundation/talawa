




read method - AsymetricKeysAdapter class - asymetric\_keys library - Dart API







menu

1. [talawa](../../index.html)
2. [models/asymetric\_keys/asymetric\_keys.dart](../../models_asymetric_keys_asymetric_keys/models_asymetric_keys_asymetric_keys-library.html)
3. [AsymetricKeysAdapter](../../models_asymetric_keys_asymetric_keys/AsymetricKeysAdapter-class.html)
4. read method

read


dark\_mode

light\_mode




# read method


1. @override

[AsymetricKeys](../../models_asymetric_keys_asymetric_keys/AsymetricKeys-class.html)
read(

1. [BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html) reader

)
override

Is called when a value has to be decoded.


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
2. [asymetric\_keys](../../models_asymetric_keys_asymetric_keys/models_asymetric_keys_asymetric_keys-library.html)
3. [AsymetricKeysAdapter](../../models_asymetric_keys_asymetric_keys/AsymetricKeysAdapter-class.html)
4. read method

##### AsymetricKeysAdapter class





talawa
1.0.0+1






