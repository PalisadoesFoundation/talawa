




assymetricEncryptString method - Encryptor class - encryptor library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/encryptor.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/)
3. [Encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor-class.html)
4. assymetricEncryptString method

assymetricEncryptString


dark\_mode

light\_mode




# assymetricEncryptString method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
assymetricEncryptString(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) data,
2. dynamic recipientPublicKey

)

Encrypts the given string data with Recipient's Public Key.

**params**:

* `data`: The string to encrypt
* `recipientPublicKey`: Key to be used to encrypt. Recipient's public
  key in our case.

**returns**:

* `String`: Encrypted string

## Implementation

```
String assymetricEncryptString(String data, RSAPublicKey recipientPublicKey) {
  final cipher = OAEPEncoding(RSAEngine())
    ..init(true, PublicKeyParameter<RSAPublicKey>(recipientPublicKey));

  final encryptedBytes = cipher.process(Uint8List.fromList(data.codeUnits));
  return base64Encode(encryptedBytes);
}
```

 


1. [talawa](../../index.html)
2. [encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/)
3. [Encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor-class.html)
4. assymetricEncryptString method

##### Encryptor class





talawa
1.0.0+1






