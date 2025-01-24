




loadKeyPair method - Encryptor class - encryptor library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/encryptor.dart](../../utils_encryptor/utils_encryptor-library.html)
3. [Encryptor](../../utils_encryptor/Encryptor-class.html)
4. loadKeyPair method

loadKeyPair


dark\_mode

light\_mode




# loadKeyPair method


Future<[AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)<[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html), [PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)>>
loadKeyPair(

1. [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html) hive

)

Loads secret keys from the Hive db.

**params**:

* `hive`: The [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html) to load keys from.

**returns**:

* `Future<AsymmetricKeyPair<PublicKey, PrivateKey>>`: The public and
  private key pair

## Implementation

```
Future<AsymmetricKeyPair<PublicKey, PrivateKey>> loadKeyPair(
  HiveInterface hive,
) async {
  final keysBox = await hive.openBox<AsymetricKeys>('user_keys');
  return keysBox.get('key_pair')!.keyPair;
}
```

 


1. [talawa](../../index.html)
2. [encryptor](../../utils_encryptor/utils_encryptor-library.html)
3. [Encryptor](../../utils_encryptor/Encryptor-class.html)
4. loadKeyPair method

##### Encryptor class





talawa
1.0.0+1






