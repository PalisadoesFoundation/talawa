
<div>

# assymetricDecryptString method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
assymetricDecryptString(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    data, ]
2.  [[[RSAPrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/RSAPrivateKey-class.html)]
    privateKey]

)



Encrypts the given string data with user\'s Private Key.

**params**:

-   `data`: The string to decrypt
-   `privateKey`: Key to be used to decrypt. User\'s private key in our
    case.

**returns**:

-   `String`: Decrypted string



## Implementation

``` language-dart
String assymetricDecryptString(String data, RSAPrivateKey privateKey) {
  final cipher = OAEPEncoding()
    ..init(false, PrivateKeyParameter<RSAPrivateKey>(privateKey));

  final decryptedBytes = cipher.process(base64Decode(data));
  return String.fromCharCodes(decryptedBytes);
}
```







1.  [talawa](../../index.html)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.html)
4.  assymetricDecryptString method

##### Encryptor class







