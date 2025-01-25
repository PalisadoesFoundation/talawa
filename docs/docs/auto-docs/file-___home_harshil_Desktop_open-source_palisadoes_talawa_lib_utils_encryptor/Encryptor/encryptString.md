




encryptString method - Encryptor class - encryptor library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/encryptor.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/)
3. [Encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor-class.html)
4. encryptString static method

encryptString


dark\_mode

light\_mode




# encryptString static method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
encryptString(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) data

)

Encrypts a given string with SHA256 Encryption.

**params**:

* `data`: The string data to encrypt

**returns**:

* `String`: SHA256 encrypted data

## Implementation

```
static String encryptString(String data) {
  if (!shouldEncrypt) return data;
  return sha256.convert(utf8.encode(data)).toString();
}
```

 


1. [talawa](../../index.html)
2. [encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/)
3. [Encryptor](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_encryptor/Encryptor-class.html)
4. encryptString static method

##### Encryptor class





talawa
1.0.0+1






