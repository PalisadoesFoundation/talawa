




assymetricDecryptString method - Encryptor class - encryptor library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/encryptor.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/)
3. [Encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor-class.html)
4. assymetricDecryptString method

assymetricDecryptString


dark\_mode

light\_mode




# assymetricDecryptString method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
assymetricDecryptString(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) data,
2. dynamic privateKey

)

Encrypts the given string data with user's Private Key.

**params**:

* `data`: The string to decrypt
* `privateKey`: Key to be used to decrypt. User's private key in our case.

**returns**:

* `String`: Decrypted string

## Implementation

```
String assymetricDecryptString(String data, RSAPrivateKey privateKey) {
  final cipher = OAEPEncoding(RSAEngine())
    ..init(false, PrivateKeyParameter<RSAPrivateKey>(privateKey));

  final decryptedBytes = cipher.process(base64Decode(data));
  return String.fromCharCodes(decryptedBytes);
}
```

 


1. [talawa](../../index.html)
2. [encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/)
3. [Encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor-class.html)
4. assymetricDecryptString method

##### Encryptor class





talawa
1.0.0+1






