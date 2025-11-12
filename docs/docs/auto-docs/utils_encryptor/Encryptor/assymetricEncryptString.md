



menu

1.  [talawa](../../index.md)
2.  [utils/encryptor.dart](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  assymetricEncryptString method


assymetricEncryptString


 dark_mode   light_mode 




<div>

# assymetricEncryptString method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
assymetricEncryptString(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    data, ]
2.  [dynamic
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









 talawa 1.0.0+1 
