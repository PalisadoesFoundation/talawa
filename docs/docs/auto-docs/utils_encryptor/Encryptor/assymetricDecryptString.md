



menu

1.  [talawa](../../index.md)
2.  [utils/encryptor.dart](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  assymetricDecryptString method


assymetricDecryptString


 dark_mode   light_mode 




<div>

# assymetricDecryptString method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
assymetricDecryptString(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    data, ]
2.  [dynamic
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
String assymetricDecryptString(String data, RSAPrivateKey privateKey) 
```







1.  [talawa](../../index.md)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  assymetricDecryptString method

##### Encryptor class









 talawa 1.0.0+1 
