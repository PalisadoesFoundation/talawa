



menu

1.  [talawa](../../index.md)
2.  [utils/encryptor.dart](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  saveKeyPair method


saveKeyPair


 dark_mode   light_mode 




<div>

# saveKeyPair method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
saveKeyPair(

1.  [dynamic keyPair,
    ]
2.  [[[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.md)]
    hive]

)



Saves the generated key pair to local storage.

Any future usage of the keys must be initiated from here.

**params**:

-   `keyPair`: `AsymmetricKeyPair` to save.
-   `hive`: The
    [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)
    to store keys in.

**returns**: None



## Implementation

``` language-dart
Future<void> saveKeyPair(
  AsymmetricKeyPair<PublicKey, PrivateKey> keyPair,
  HiveInterface hive,
) async 
```







1.  [talawa](../../index.md)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  saveKeyPair method

##### Encryptor class









 talawa 1.0.0+1 
