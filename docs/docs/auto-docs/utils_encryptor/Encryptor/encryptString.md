
<div>

# encryptString static method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
encryptString(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    data]

)



Encrypts a given string with SHA256 Encryption.

**params**:

-   `data`: The string data to encrypt

**returns**:

-   `String`: SHA256 encrypted data



## Implementation

``` language-dart
static String encryptString(String data) {
  if (!shouldEncrypt) return data;
  return sha256.convert(utf8.encode(data)).;
}
```







1.  [talawa](../../index.html)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.html)
4.  encryptString static method

##### Encryptor class







