




receiveMessage method - Encryptor class - encryptor library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/encryptor.dart](../../utils_encryptor/utils_encryptor-library.html)
3. [Encryptor](../../utils_encryptor/Encryptor-class.html)
4. receiveMessage method

receiveMessage


dark\_mode

light\_mode




# receiveMessage method


Future<void>
receiveMessage(

1. Map<String, dynamic> message,
2. [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html) hive

)

Helper function to decrypt the message.

Internally uses the [loadKeyPair](../../utils_encryptor/Encryptor/loadKeyPair.html) function to get private key and
[assymetricDecryptString](../../utils_encryptor/Encryptor/assymetricDecryptString.html) to decrypt the given message.

**params**:

* `message`: Message object containing a field named `encryptedMessage`
  which is supposed to contained user's message in encrypted format.
* `hive`: The [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html) to store things in.

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
2. [encryptor](../../utils_encryptor/utils_encryptor-library.html)
3. [Encryptor](../../utils_encryptor/Encryptor-class.html)
4. receiveMessage method

##### Encryptor class





talawa
1.0.0+1






