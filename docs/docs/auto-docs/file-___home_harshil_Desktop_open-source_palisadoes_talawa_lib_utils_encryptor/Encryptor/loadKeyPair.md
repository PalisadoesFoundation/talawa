




loadKeyPair method - Encryptor class - encryptor library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/encryptor.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/)
3. [Encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor-class.html)
4. loadKeyPair method

loadKeyPair


dark\_mode

light\_mode




# loadKeyPair method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
loadKeyPair(

1. dynamic hive

)

Loads secret keys from the Hive db.

**params**:

* `hive`: The `HiveInterface` to load keys from.

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
2. [encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/)
3. [Encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor-class.html)
4. loadKeyPair method

##### Encryptor class





talawa
1.0.0+1






