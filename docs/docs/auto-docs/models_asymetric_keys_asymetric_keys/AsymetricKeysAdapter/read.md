
<div>

# read method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[AsymetricKeys](../../models_asymetric_keys_asymetric_keys/AsymetricKeys-class.html)]
read(

1.  [[[BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html)]
    reader]

)


override




Is called when a value has to be decoded.



## Implementation

``` language-dart
@override
AsymetricKeys read(BinaryReader reader) {
  final numOfFields = reader.;
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.: reader.,
  };
  return AsymetricKeys(
    keyPair: fields[0] as AsymmetricKeyPair<PublicKey, PrivateKey>,
  );
}
```







1.  [talawa](../../index.html)
2.  [asymetric_keys](../../models_asymetric_keys_asymetric_keys/)
3.  [AsymetricKeysAdapter](../../models_asymetric_keys_asymetric_keys/AsymetricKeysAdapter-class.html)
4.  read method

##### AsymetricKeysAdapter class







