
<div>

# write method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

void write(

1.  [[[BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html)]
    writer, ]
2.  [[[AsymetricKeys](../../models_asymetric_keys_asymetric_keys/AsymetricKeys-class.html)]
    obj]

)


override




Is called when a value has to be encoded.



## Implementation

``` language-dart
@override
void write(BinaryWriter writer, AsymetricKeys obj) {
  writer
    ..writeByte(1)
    ..writeByte(0)
    ..write(obj.keyPair);
}
```







1.  [talawa](../../index.html)
2.  [asymetric_keys](../../models_asymetric_keys_asymetric_keys/)
3.  [AsymetricKeysAdapter](../../models_asymetric_keys_asymetric_keys/AsymetricKeysAdapter-class.html)
4.  write method

##### AsymetricKeysAdapter class







