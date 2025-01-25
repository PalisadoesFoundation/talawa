




saveKeyPair method - Encryptor class - encryptor library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/encryptor.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/)
3. [Encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor-class.html)
4. saveKeyPair method

saveKeyPair


dark\_mode

light\_mode




# saveKeyPair method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
saveKeyPair(

1. dynamic keyPair,
2. dynamic hive

)

Saves the generated key pair to local storage.

Any future usage of the keys must be initiated from here.

**params**:

* `keyPair`: `AsymmetricKeyPair` to save.
* `hive`: The `HiveInterface` to store keys in.

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
2. [encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/)
3. [Encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor-class.html)
4. saveKeyPair method

##### Encryptor class





talawa
1.0.0+1






