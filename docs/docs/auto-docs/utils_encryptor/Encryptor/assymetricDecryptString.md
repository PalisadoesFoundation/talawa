




assymetricDecryptString method - Encryptor class - encryptor library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/encryptor.dart](../../utils_encryptor/utils_encryptor-library.html)
3. [Encryptor](../../utils_encryptor/Encryptor-class.html)
4. assymetricDecryptString method

assymetricDecryptString


dark\_mode

light\_mode




# assymetricDecryptString method


String
assymetricDecryptString(

1. String data,
2. [RSAPrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/RSAPrivateKey-class.html) privateKey

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
2. [encryptor](../../utils_encryptor/utils_encryptor-library.html)
3. [Encryptor](../../utils_encryptor/Encryptor-class.html)
4. assymetricDecryptString method

##### Encryptor class





talawa
1.0.0+1






