
<div>

# assymetricEncryptString method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
assymetricEncryptString(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    data, ]
2.  [[[RSAPublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/RSAPublicKey-class.html)]
    recipientPublicKey]

)



Encrypts the given string data with Recipient\'s Public Key.

**params**:

-   `data`: The string to encrypt
-   `recipientPublicKey`: Key to be used to encrypt. Recipient\'s public
    key in our case.

**returns**:

-   `String`: Encrypted string



## Implementation

``` language-dart
String assymetricEncryptString(String data, RSAPublicKey recipientPublicKey) 
```







1.  [talawa](../../index.md)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  assymetricEncryptString method

##### Encryptor class







