




saveKeyPair method - Encryptor class - encryptor library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/encryptor.dart](../../utils_encryptor/utils_encryptor-library.html)
3. [Encryptor](../../utils_encryptor/Encryptor-class.html)
4. saveKeyPair method

saveKeyPair


dark\_mode

light\_mode




# saveKeyPair method


Future<void>
saveKeyPair(

1. [AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)<[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html), [PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)> keyPair,
2. [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html) hive

)

Saves the generated key pair to local storage.

Any future usage of the keys must be initiated from here.

**params**:

* `keyPair`: [AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html) to save.
* `hive`: The [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html) to store keys in.

**returns**:
None


## Implementation

```
Future<void> saveKeyPair(
  AsymmetricKeyPair<PublicKey, PrivateKey> keyPair,
  HiveInterface hive,
) async {
  // TODO: Implement secure storage here
  final Box<AsymetricKeys> keysBox =
      await hive.openBox<AsymetricKeys>('user_keys');
  keysBox.put('key_pair', AsymetricKeys(keyPair: keyPair));
}
```

 


1. [talawa](../../index.html)
2. [encryptor](../../utils_encryptor/utils_encryptor-library.html)
3. [Encryptor](../../utils_encryptor/Encryptor-class.html)
4. saveKeyPair method

##### Encryptor class





talawa
1.0.0+1






