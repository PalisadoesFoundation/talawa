



menu

1.  [talawa](../../index.md)
2.  [utils/encryptor.dart](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  loadKeyPair method


loadKeyPair


 dark_mode   light_mode 




<div>

# loadKeyPair method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]
loadKeyPair(

1.  [[[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.md)]
    hive]

)



Loads secret keys from the Hive db.

**params**:

-   `hive`: The
    [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)
    to load keys from.

**returns**:

-   `Future<AsymmetricKeyPair<PublicKey, PrivateKey>>`: The public and
    private key pair



## Implementation

``` language-dart
Future<AsymmetricKeyPair<PublicKey, PrivateKey>> loadKeyPair(
  HiveInterface hive,
) async 
```







1.  [talawa](../../index.md)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  loadKeyPair method

##### Encryptor class









 talawa 1.0.0+1 
