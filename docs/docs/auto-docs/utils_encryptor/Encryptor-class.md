
<div>

# Encryptor class

</div>


Handles all of the encryption tasks in the codebase.



## Constructors

[Encryptor](../utils_encryptor/Encryptor/Encryptor.md)

:   



## Properties

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[assymetricDecryptString](../utils_encryptor/Encryptor/assymetricDecryptString.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] data, ][[[RSAPrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/RSAPrivateKey-class.html)] privateKey]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Encrypts the given string data with user\'s Private Key.

[[assymetricEncryptString](../utils_encryptor/Encryptor/assymetricEncryptString.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] data, ][[[RSAPublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/RSAPublicKey-class.html)] recipientPublicKey]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Encrypts the given string data with Recipient\'s Public Key.

[[generateRSAKeyPair](../utils_encryptor/Encryptor/generateRSAKeyPair.md)][() [→ [AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)[\<[[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html)], [[PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)]\>]] ]
:   Generates RSA Key Pairs (Public/Private).

[[loadKeyPair](../utils_encryptor/Encryptor/loadKeyPair.md)][([[[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.md)] hive]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)[\<[[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html)], [[PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)]\>]]\>]] ]
:   Loads secret keys from the Hive db.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[receiveMessage](../utils_encryptor/Encryptor/receiveMessage.md)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] message, ][[[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)] hive]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Helper function to decrypt the message.

[[saveKeyPair](../utils_encryptor/Encryptor/saveKeyPair.md)][([[[AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.md)[\<[[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html)], [[PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)]\>]] keyPair, ][[[HiveInterface](https://pub.dev/documentation/hive/2.2.3/hive/HiveInterface-class.html)] hive]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Saves the generated key pair to local storage.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::



## Static Properties

[[shouldEncrypt](../utils_encryptor/Encryptor/shouldEncrypt.md)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   A global switch to flag the encryption.
    ::: features
    getter/setter pair
    :::



## Static Methods

[[encryptString](../utils_encryptor/Encryptor/encryptString.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] data]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Encrypts a given string with SHA256 Encryption.







1.  [talawa](../index.md)
2.  [encryptor](../utils_encryptor/)
3.  Encryptor class

##### encryptor library







