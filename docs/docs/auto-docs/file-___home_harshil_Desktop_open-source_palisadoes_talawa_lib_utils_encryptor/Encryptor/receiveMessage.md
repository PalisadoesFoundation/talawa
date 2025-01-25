




receiveMessage method - Encryptor class - encryptor library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/encryptor.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/)
3. [Encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor-class.html)
4. receiveMessage method

receiveMessage


dark\_mode

light\_mode




# receiveMessage method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
receiveMessage(

1. [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> message,
2. dynamic hive

)

Helper function to decrypt the message.

Internally uses the [loadKeyPair](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor/loadKeyPair.html) function to get private key and
[assymetricDecryptString](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor/assymetricDecryptString.html) to decrypt the given message.

**params**:

* `message`: Message object containing a field named `encryptedMessage`
  which is supposed to contained user's message in encrypted format.
* `hive`: The `HiveInterface` to store things in.

**returns**:
None


## Implementation

```
Future<void> receiveMessage(
  Map<String, dynamic> message,
  HiveInterface hive,
) async {
  try {
    final encryptedMessage = message['encryptedMessage'] as String;
    final privateKey = (await loadKeyPair(hive)).privateKey;
    final decryptedMessage = assymetricDecryptString(
      encryptedMessage,
      privateKey as RSAPrivateKey,
    );

    print('Decrypted Message: $decryptedMessage');
  } catch (e) {
    throw Exception('Error');
  }
}
```

 


1. [talawa](../../index.html)
2. [encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/)
3. [Encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor-class.html)
4. receiveMessage method

##### Encryptor class





talawa
1.0.0+1






