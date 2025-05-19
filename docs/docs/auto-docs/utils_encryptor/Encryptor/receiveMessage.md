
<div>

# receiveMessage method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
receiveMessage(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    message, ]
2.  [[[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)]
    hive]

)



Helper function to decrypt the message.

Internally uses the
[loadKeyPair](../../utils_encryptor/Encryptor/loadKeyPair.md) function
to get private key and
[assymetricDecryptString](../../utils_encryptor/Encryptor/assymetricDecryptString.md)
to decrypt the given message.

**params**:

-   `message`: Message object containing a field named
    `encryptedMessage` which is supposed to contained user\'s message in
    encrypted format.
-   `hive`: The
    [HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)
    to store things in.

**returns**: None



## Implementation

``` language-dart
Future<void> receiveMessage(
  Map<String, dynamic> message,
  HiveInterface hive,
) async 
```







1.  [talawa](../../index.md)
2.  [encryptor](../../utils_encryptor/)
3.  [Encryptor](../../utils_encryptor/Encryptor-class.md)
4.  receiveMessage method

##### Encryptor class







